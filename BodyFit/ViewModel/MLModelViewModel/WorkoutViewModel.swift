//
//  WorkoutViewModel.swift
//  BodyFit
//
//  Created by Jumman Hossen on 28/10/24.
//

//import Foundation
//import RealmSwift
//
//class WorkoutViewModel: ObservableObject {
//    private let realm = try! Realm()
//    private var user: User?                           // Load from existing User model
//
//    @Published var weeklyWorkoutPlan: WeeklyWorkoutPlan?
//
//    init(user: User) {
//        self.user = user
//        loadWeeklyWorkoutPlan()
//    }
//
//    // Loads or initializes a weekly workout plan
//    private func loadWeeklyWorkoutPlan() {
//        if let existingPlan = realm.objects(WeeklyWorkoutPlan.self)
//            .filter("userId == %@", user?.id)
//            .sorted(byKeyPath: "startDate", ascending: false)
//            .first {
//            weeklyWorkoutPlan = existingPlan
//        } else {
//            createDefaultWeeklyPlan()
//        }
//    }
//
//    // Function to add a workout session
//    func addWorkoutSession(type: String, exercises: [Exercise]) {
//        let session = WorkoutSession()
//        session.date = Date()
//        session.type = type
//        session.duration = exercises.reduce(0) { $0 + ($1.duration ?? 0) }
//        
//        try! realm.write {
//            session.exercises.append(objectsIn: exercises)
//            weeklyWorkoutPlan?.workoutSessions.append(session)
//        }
//    }
//
//    // Create default weekly workout plan based on uploaded JSON
//    private func createDefaultWeeklyPlan() {
//        // Placeholder for loading from JSON if needed
//    }
//}

import Foundation
import SwiftUI

class WorkoutViewModel: ObservableObject {
    @Published var recommendedWorkout: String = ""
    
    // Properties for user information (replace with actual user data retrieval logic)
    private var userAge = 25
    private var userWeight = 70.0
    private var userCalorieTarget = 2000

    // Weekly workout count and limits
    private var workoutCount: [String: Int] = ["Push": 0, "Pull": 0, "Leg": 0, "Cardio": 0, "Cycling": 0]
    private let maxWorkoutsPerType = ["Push": 2, "Pull": 2, "Leg": 2, "Cardio": 2, "Cycling": 1]

    // Recommendation function with weekly limit check
    func fetchRecommendation(for workoutType: String) {
        // Get recommendation from the ML model (replace this with actual ML model prediction)
        let recommendedType = recommendWorkoutType()

        // Check if the recommended workout type can be added within the weekly limits
        if isWorkoutTypeAllowed(type: recommendedType) {
            addWorkout(type: recommendedType)
            recommendedWorkout = "Recommended \(recommendedType)"
        } else {
            recommendedWorkout = "\(recommendedType) skipped to avoid exceeding weekly limit"
        }
    }

    // Mock recommendation from ML model for demonstration (replace with actual model call)
    private func recommendWorkoutType() -> String {
        // Dummy logic to alternate workout types; in real usage, replace with ML model's recommendation
        let workoutTypes = ["Push", "Pull", "Leg", "Cardio", "Cycling"]
        return workoutTypes.randomElement() ?? "Push"
    }

    // Adds a workout to the weekly plan if it’s within limit
    private func addWorkout(type: String) {
        workoutCount[type, default: 0] += 1
    }

    // Checks if a workout type is within the weekly limit
    private func isWorkoutTypeAllowed(type: String) -> Bool {
        return (workoutCount[type] ?? 0) < (maxWorkoutsPerType[type] ?? 0)
    }

    // Reset weekly plan counts (if you need a reset mechanism for a new week)
    func resetWeeklyPlan() {
        workoutCount = ["Push": 0, "Pull": 0, "Leg": 0, "Cardio": 0, "Cycling": 0]
    }
}
