//
//  DietEntry.swift
//  BodyFit
//
//  Created by Jumman Hossen on 28/10/24.
//

import RealmSwift

class Meal: EmbeddedObject, Identifiable {
    @Persisted var id = ObjectId.generate()  // Unique identifier for each meal
    @Persisted var name: String
    @Persisted var calories: Int
    @Persisted var protein: Double
    @Persisted var carbs: Double
    @Persisted var fats: Double
}

class DietEntry: Object, Identifiable {
    @Persisted(primaryKey: true) var id: ObjectId  // Unique identifier for each entry
    @Persisted var date: String                   // Date in "YYYY-MM-DD" format
    @Persisted var calorieTarget: Int             // Daily calorie target
    @Persisted var meals = List<Meal>()           // List of meals in a day
}
