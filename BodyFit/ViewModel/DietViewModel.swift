//
//  DietViewModel.swift
//  BodyFit
//
//  Created by Jumman Hossen on 28/10/24.
//

import Foundation
import RealmSwift

class DietViewModel: ObservableObject {
    private let realm = try! Realm()  // Initialize Realm instance
    
    @Published var dietEntries: [DietEntry] = []  // Store DietEntry data in an array for SwiftUI

    init() {
        loadDietEntriesFromRealm()
    }
    
    // Load data from Realm
    private func loadDietEntriesFromRealm() {
        let entries = realm.objects(DietEntry.self).sorted(byKeyPath: "date", ascending: true)
        self.dietEntries = Array(entries)  // Convert Results to Array for SwiftUI compatibility
    }

    // Add a new DietEntry to Realm
    func addDietEntry(date: String, calorieTarget: Int, meals: [Meal]) {
        let newDietEntry = DietEntry()
        newDietEntry.date = date
        newDietEntry.calorieTarget = calorieTarget
        newDietEntry.meals.append(objectsIn: meals)  // Add meals to the DietEntry
        
        try! realm.write {
            realm.add(newDietEntry)
        }
        
        loadDietEntriesFromRealm()  // Refresh data after adding
    }
    
    // Calculate total calories for a specific date
    func totalCalories(for date: String) -> Int {
        if let entry = dietEntries.first(where: { $0.date == date }) {
            return entry.meals.reduce(0) { $0 + $1.calories }
        }
        return 0
    }
}
