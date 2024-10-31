//
//  UserModel.swift
//  BodyFit
//
//  Created by Jumman Hossen on 28/10/24.
//

import Foundation
import RealmSwift

class User: Object, Identifiable {
    @Persisted(primaryKey: true) var id: ObjectId  // Realm-compatible primary key
    @Persisted var name: String
    @Persisted var gender: String
    @Persisted var age: Int
    @Persisted var height: Double  // in centimeters
    @Persisted var weight: Double  // in kilograms
    @Persisted var activityLevel: String  // e.g., "Sedentary", "Light", "Moderate", etc.
    @Persisted var goal: String  // e.g., "Lose Weight", "Build Muscle"
    @Persisted var preferences: Preferences?  // Embedded preferences object

    // Initializer for setting up a User object with default values
    convenience init(name: String, gender: String, age: Int, height: Double, weight: Double, activityLevel: String, goal: String, preferences: Preferences) {
        self.init()
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

class Preferences: EmbeddedObject {
    @Persisted var dailyCalorieGoal: Int
    @Persisted var proteinGoal: Double  // grams
    @Persisted var carbGoal: Double  // grams
    @Persisted var fatGoal: Double  // grams
    @Persisted var measurementUnit: String  // e.g., "kg" or "lbs"

    // Initializer for Preferences with default values
    convenience init(dailyCalorieGoal: Int, proteinGoal: Double, carbGoal: Double, fatGoal: Double, measurementUnit: String) {
        self.init()
        self.dailyCalorieGoal = dailyCalorieGoal
        self.proteinGoal = proteinGoal
        self.carbGoal = carbGoal
        self.fatGoal = fatGoal
        self.measurementUnit = measurementUnit
    }
}
