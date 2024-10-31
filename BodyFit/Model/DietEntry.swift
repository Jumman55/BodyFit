//
//  DietEntry.swift
//  BodyFit
//
//  Created by Jumman Hossen on 28/10/24.
//

import Foundation
import RealmSwift

class Meal: EmbeddedObject, Identifiable {
    @Persisted var type: String
    @Persisted var mealDescription: String
    @Persisted var calories: Int
    @Persisted var protein: Int
    @Persisted var carbs: Int
    @Persisted var fats: Int
}

class DietEntry: Object, Identifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var date: String                    // e.g., "2024-10-28"
    @Persisted var meals = List<Meal>()
}
