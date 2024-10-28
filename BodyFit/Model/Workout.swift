//
//  WorkoutModel.swift
//  BodyFit
//
//  Created by Jumman Hossen on 28/10/24.
//

import Foundation

// Model representing a workout routine
struct WorkoutModel: Identifiable, Hashable {
    let id = UUID()               // Unique identifier for each workout
    var title: String             // Title of the workout routine
    var exercises: [Exercise]     // List of exercises in the workout
    
    // Nested model representing an individual exercise
    struct Exercise: Identifiable, Hashable {
        let id = UUID()           // Unique identifier for each exercise
        var name: String          // Name of the exercise
        var sets: Int             // Number of sets for the exercise
        var reps: Int             // Number of reps per set
    }
}
