//
//  WorkoutModel.swift
//  BodyFit
//
//  Created by Jumman Hossen on 28/10/24.
//

import Foundation
import RealmSwift

// Enum for workout intensity tags
enum Intensity: String, PersistableEnum {
    case low = "Low"
    case moderate = "Moderate"
    case high = "High"
}

// Represents a single exercise within a workout
class Exercise: EmbeddedObject, Identifiable {
    @Persisted var name: String                      // e.g., "Bench Press", "Squats"
    @Persisted var sets: Int?                        // Number of sets (optional for cardio)
    @Persisted var reps: Int?                        // Number of reps per set (optional for cardio)
    @Persisted var duration: Int?                    // Duration in minutes (mainly for cardio)
    @Persisted var intensity: Intensity?             // Intensity tag (Low, Moderate, High)
}

// Represents a workout session for a specific day
class WorkoutSession: Object, Identifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var date: Date                        // Date of the workout session
    @Persisted var type: String                      // Type of workout (e.g., "Push", "Pull", "Leg")
    @Persisted var exercises = List<Exercise>()      // List of exercises in this workout
    @Persisted var duration: Int                     // Total duration of the workout in minutes
}

// Represents a user's weekly workout plan with each day's planned session
class WeeklyWorkoutPlan: Object, Identifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var userId: ObjectId                  // Link to the User's ID
    @Persisted var startDate: Date                   // Start date of the weekly plan
    @Persisted var workoutSessions = List<WorkoutSession>()  // List of planned sessions for the week
}
