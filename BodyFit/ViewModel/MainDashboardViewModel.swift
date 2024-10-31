//
//  MainDashboardViewModel.swift
//  BodyFit
//
//  Created by Jumman Hossen on 28/10/24.
//

import Foundation
import RealmSwift

class MainDashboardViewModel: ObservableObject {
    private let realm = try! Realm()
    private var user: User?
    
    @Published var caloriesConsumed: Int = 0
    @Published var calorieTarget: Int = 0  // Will update based on user preferences if available
    @Published var workoutsCompleted: Int = 0
    @Published var totalWorkouts: Int = 0

    init() {
        loadUserProfile()
        loadDashboardData()
    }
    
    // Load the user profile from Realm and set calorieTarget safely
    private func loadUserProfile() {
        guard let existingUser = realm.objects(User.self).first else {
            print("User profile not found. Make sure a user profile is created.")
            self.calorieTarget = 2000  // Default to 2000 if user profile is missing
            return
        }
        
        self.user = existingUser
        self.calorieTarget = existingUser.preferences?.dailyCalorieGoal ?? 2000  // Set target from user preferences or default
    }
    
    // Summarize diet and workout data for dashboard
    private func loadDashboardData() {
        // Assuming `dietViewModel` and `workoutViewModel` are set up correctly
        // Here you can add logic to calculate `caloriesConsumed` and `workoutsCompleted`
    }
    
    // Computed property if you still want to access `calorieTarget` directly from `user`
    var userCalorieTarget: Int {
        return user?.preferences?.dailyCalorieGoal ?? calorieTarget
    }
}
