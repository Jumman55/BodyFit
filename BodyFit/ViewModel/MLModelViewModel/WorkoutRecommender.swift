//
//  WorkoutRecommender.swift
//  BodyFit
//
//  Created by Jumman Hossen on 01/11/24.
//

import Foundation
import CoreML

class WorkoutRecommender {
    private let model: WorkoutTypeRecommender
    
    init() {
        // Use the recommended initializer for handling deprecation
        do {
            model = try WorkoutTypeRecommender(configuration: MLModelConfiguration())
        } catch {
            fatalError("Failed to initialize WorkoutTypeRecommender model: \(error)")
        }
    }

    // Function to get a workout recommendation based on user data
    func recommendWorkout(age: Int, weight: Double, calorieTarget: Int, workoutHistory: [String]) -> String? {
        do {
            // Convert Double to Int64 as expected by the model
            let input = WorkoutTypeRecommenderInput(
                age: Int64(age),
                weight: Int64(weight),
                calorieTarget: Int64(calorieTarget)
            )

            // Get the prediction
            let prediction = try model.prediction(input: input)
            
            // Use weekly logic to enforce workout variety
            if isAllowedInWeeklyPlan(prediction.workoutType, history: workoutHistory) {
                return prediction.workoutType
            } else {
                return suggestAlternative(workoutHistory: workoutHistory)
            }

        } catch {
            print("Error predicting workout type: \(error)")
            return nil
        }
    }

    // Check if the workout is allowed based on weekly plan
    private func isAllowedInWeeklyPlan(_ workoutType: String, history: [String]) -> Bool {
        let weeklyLimits = ["Push": 2, "Pull": 2, "Leg": 2, "Cardio": 2, "Cycling": 1]
        let currentCount = history.filter { $0 == workoutType }.count
        return currentCount < (weeklyLimits[workoutType] ?? 0)
    }
    
    // Suggest alternative if the limit is reached
    private func suggestAlternative(workoutHistory: [String]) -> String {
        let options = ["Push", "Pull", "Leg", "Cardio", "Cycling"]
        return options.first(where: { isAllowedInWeeklyPlan($0, history: workoutHistory) }) ?? "Rest"
    }
}
