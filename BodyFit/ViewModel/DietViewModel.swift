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
    @Published var dietEntries: [DietEntry] = []  // Store DietEntry data for SwiftUI
    private var user: User?  // User profile data

    init() {
        loadUserProfile()
        loadDietEntriesFromRealm()
    }

    // Load the user profile from Realm or set up a default if not present
    private func loadUserProfile() {
        if let existingUser = realm.objects(User.self).first {
            self.user = existingUser
        } else {
            // Initialize a default user profile if none exists
            initializeDefaultUser()  // This method should be in RealmDatabaseSetup.swift
            self.user = realm.objects(User.self).first  // Load the newly created default user
        }
    }

    // Load diet entries from Realm
    private func loadDietEntriesFromRealm() {
        let entries = realm.objects(DietEntry.self).sorted(byKeyPath: "date", ascending: true)
        self.dietEntries = Array(entries)  // Convert Results to Array for SwiftUI compatibility
    }

    // Computed property to retrieve the calorie target from the user's preferences
    var calorieTarget: Int {
        return user?.preferences?.dailyCalorieGoal ?? 0  // Default to 0 if not set
    }

    // Add a new DietEntry for the week without a calorie target in the entry itself
    func addWeeklyDietEntry(startDate: String, meals: [Meal] = []) {
        let newDietEntry = DietEntry()
        newDietEntry.date = startDate
        newDietEntry.meals.append(objectsIn: meals)  // Set initial meals if provided

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

    // Calculate total protein for a specific date
    func totalProtein(for date: String) -> Int {
        if let entry = dietEntries.first(where: { $0.date == date }) {
            return entry.meals.reduce(0) { $0 + $1.protein }
        }
        return 0
    }

    // Calculate total carbs for a specific date
    func totalCarbs(for date: String) -> Int {
        if let entry = dietEntries.first(where: { $0.date == date }) {
            return entry.meals.reduce(0) { $0 + $1.carbs }
        }
        return 0
    }

    // Calculate total fats for a specific date
    func totalFats(for date: String) -> Int {
        if let entry = dietEntries.first(where: { $0.date == date }) {
            return entry.meals.reduce(0) { $0 + $1.fats }
        }
        return 0
    }

    // Retrieve day name for a specific DietEntry's date
    func dayName(for entry: DietEntry) -> String {
        return DateUtils.dayName(from: entry.date)
    }
}
