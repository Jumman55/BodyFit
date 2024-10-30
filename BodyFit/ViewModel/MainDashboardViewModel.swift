//
//  MainDashboardViewModel.swift
//  BodyFit
//
//  Created by Jumman Hossen on 28/10/24.
//

import Foundation

class MainDashboardViewModel: ObservableObject {
    @Published var caloriesConsumed: Int = 0
    @Published var calorieTarget: Int = 0
    @Published var workoutsCompleted: Int = 0
    @Published var totalWorkouts: Int = 0
    
    private var dietViewModel = DietViewModel()
    private var workoutViewModel = WorkoutViewModel()
    
    init() {
        loadDashboardData()
    }
    
    private func loadDashboardData() {
        // Summarize diet data
        if let todayDietEntry = dietViewModel.dietEntries.first { // assuming the first entry is today for demo
            self.caloriesConsumed = todayDietEntry.meals.reduce(0) { $0 + $1.calories }
            self.calorieTarget = todayDietEntry.calorieTarget
        }
        
        // Summarize workout data
        self.workoutsCompleted = workoutViewModel.workouts.count // Simplified for demo
        self.totalWorkouts = 7 // Example goal; adjust as needed
    }
}
