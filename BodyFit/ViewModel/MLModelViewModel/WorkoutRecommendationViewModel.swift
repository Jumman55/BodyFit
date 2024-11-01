//
//  WorkoutRecommender.swift
//  BodyFit
//
//  Created by Jumman Hossen on 01/11/24.
//

import Foundation
import CoreML

class WorkoutRecommendationViewModel: ObservableObject {
    @Published var recommendedWorkout: String = ""
    private let workoutViewModel = WorkoutViewModel()  // Instance of WorkoutViewModel to manage recommendations
    
    // Function to get a workout recommendation for the specified workout type
    func getRecommendation(for workoutType: String) {
        workoutViewModel.fetchRecommendation(for: workoutType)
        recommendedWorkout = workoutViewModel.recommendedWorkout
    }
    
    // Reset the weekly workout plan
    func resetWeeklyPlan() {
        workoutViewModel.resetWeeklyPlan()
    }
}
