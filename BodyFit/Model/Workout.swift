//
//  WorkoutModel.swift
//  BodyFit
//
//  Created by Jumman Hossen on 28/10/24.
//

import Foundation

struct Workout: Codable, Identifiable {
    let id: UUID
    var date: String // e.g., "2024-01-01"
    var type: String // e.g., "Push", "Pull", "Leg"
    var exercises: [Exercise]
    
    struct Exercise: Codable, Identifiable {
        let id: UUID
        var name: String  // e.g., "Bench Press"
        var sets: Int
        var reps: Int
        var weight: Double // weight lifted per set in kg or lbs
    }
    
    // Initializer to set up a workout with sample data
    init(id: UUID = UUID(), date: String, type: String, exercises: [Exercise]) {
        self.id = id
        self.date = date
        self.type = type
        self.exercises = exercises
    }
}
