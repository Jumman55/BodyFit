//
//  UserModel.swift
//  BodyFit
//
//  Created by Jumman Hossen on 28/10/24.
//

import Foundation

struct User: Codable, Identifiable {
    let id: UUID
    var name: String
    var gender: String
    var age: Int
    var height: Double // in centimeters
    var weight: Double // in kilograms
    var activityLevel: String // e.g., "Sedentary", "Light", "Moderate", "Active", "Very Active"
    var goal: String // e.g., "Lose Weight", "Build Muscle"
    var preferences: Preferences
    
    struct Preferences: Codable {
        var dailyCalorieGoal: Int
        var proteinGoal: Double // grams
        var carbGoal: Double // grams
        var fatGoal: Double // grams
        var measurementUnit: String // e.g., "kg" or "lbs"
    }
    
    // Initializer for default values
    init(
        id: UUID = UUID(),
        name: String,
        gender: String,
        age: Int,
        height: Double,
        weight: Double,
        activityLevel: String,
        goal: String,
        preferences: Preferences
    ) {
        self.id = id
        self.name = name
        self.gender = gender
        self.age = age
        self.height = height
        self.weight = weight
        self.activityLevel = activityLevel
        self.goal = goal
        self.preferences = preferences
    }
}
