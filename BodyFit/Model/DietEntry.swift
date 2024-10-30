//
//  DietEntry.swift
//  BodyFit
//
//  Created by Jumman Hossen on 28/10/24.
//

import Foundation

struct DietEntry: Codable, Identifiable {
    let id: UUID
    var date: String // Use "YYYY-MM-DD" format for simplicity
    var meals: [Meal]
    var calorieTarget: Int // Daily calorie target for the user
    
    // Nested Meal struct for individual meals in a day
    struct Meal: Codable, Identifiable {
        let id: UUID
        var name: String  // e.g., "Breakfast", "Lunch"
        var calories: Int
        var protein: Double // in grams
        var carbs: Double   // in grams
        var fats: Double    // in grams
    }
    
    // Initializer to set up a sample entry
    init(id: UUID = UUID(), date: String, meals: [Meal], calorieTarget: Int) {
        self.id = id
        self.date = date
        self.meals = meals
        self.calorieTarget = calorieTarget
    }
}
