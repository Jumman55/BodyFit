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

    func getRecommendation(for workoutType: String) {
        // Your logic to get workout recommendation
        self.recommendedWorkout = "Your recommended workout for \(workoutType)"
    }
}
