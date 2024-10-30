//
//  WeeklyAnalysisViewModel.swift
//  BodyFit
//
//  Created by Jumman Hossen on 28/10/24.
//

import Foundation

struct DailySummary: Identifiable {
    let id = UUID()
    let day: String  // e.g., "Monday"
    let calories: Int
    let protein: Double
    let carbs: Double
    let fats: Double
    let workoutsCompleted: Bool
}

class WeeklyAnalysisViewModel: ObservableObject {
    @Published var dailySummaries: [DailySummary] = []
    @Published var calorieTarget: Int = 2500
    
    private var dietViewModel = DietViewModel()
    private var workoutViewModel = WorkoutViewModel()
    
    init() {
        calculateWeeklyData()
        sortSummariesByWeekday() //sort the chart from monday
    }
    
    private func calculateWeeklyData() {
        let dietEntries = dietViewModel.dietEntries
        let workoutDates = Set(workoutViewModel.workouts.map { $0.date }) // Dates with completed workouts

        // Map daily data into summaries by day
        dailySummaries = dietEntries.enumerated().map { index, entry in
            let day = Calendar.current.weekdaySymbols[index % 7] // Day names, assuming entries align with weekdays
            let calories = entry.meals.reduce(0) { $0 + $1.calories }
            let protein = entry.meals.reduce(0) { $0 + $1.protein }
            let carbs = entry.meals.reduce(0) { $0 + $1.carbs }
            let fats = entry.meals.reduce(0) { $0 + $1.fats }
            let workoutsCompleted = workoutDates.contains(entry.date)

            return DailySummary(
                day: day,
                calories: calories,
                protein: protein,
                carbs: carbs,
                fats: fats,
                workoutsCompleted: workoutsCompleted
            )
        }
    }
    
    private func sortSummariesByWeekday() {
            // Custom order for days starting from Monday
            let daysOrder = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
            dailySummaries.sort { daysOrder.firstIndex(of: $0.day)! < daysOrder.firstIndex(of: $1.day)! }
        }
}
