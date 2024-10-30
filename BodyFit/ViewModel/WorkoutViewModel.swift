//
//  WorkoutViewModel.swift
//  BodyFit
//
//  Created by Jumman Hossen on 28/10/24.
//

import Foundation

class WorkoutViewModel: ObservableObject {
    @Published var workouts: [Workout] = []
    
    init() {
        loadWorkouts()
    }
    
    private func loadWorkouts() {
        guard let url = Bundle.main.url(forResource: "Workout", withExtension: "json") else {
            print("Workout.json file not found.")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let loadedWorkouts = try JSONDecoder().decode([Workout].self, from: data)
            self.workouts = loadedWorkouts
            print("Workouts loaded successfully.")
        } catch {
            print("Error loading workouts: \(error)")
        }
    }
}
