//
//  DietViewModel.swift
//  BodyFit
//
//  Created by Jumman Hossen on 28/10/24.
//

import Foundation
import RealmSwift

class DietViewModel: ObservableObject {
    private let realm: Realm
    @Published var dietEntries: [DietEntry] = []
    private var user: User?
    
    init() {
        do {
            // Configure Realm to delete the database if a migration is needed
            var config = Realm.Configuration.defaultConfiguration
            config.deleteRealmIfMigrationNeeded = true
            Realm.Configuration.defaultConfiguration = config
            
            self.realm = try Realm()  // Safely initialize Realm
            loadUserProfile()
            loadDietEntriesFromRealm()
        } catch {
            fatalError("Error initializing Realm: \(error.localizedDescription)")
        }
    }
    
    private func loadUserProfile() {
        if let existingUser = realm.objects(User.self).first {
            self.user = existingUser
        } else {
            initializeDefaultUser()  // Check RealmDatabaseSetup.swift to ensure this creates a User
            self.user = realm.objects(User.self).first
        }
    }
    
    private func loadDietEntriesFromRealm() {
        let entries = realm.objects(DietEntry.self).sorted(byKeyPath: "date", ascending: true)
        self.dietEntries = Array(entries)
    }
    
    var calorieTarget: Int {
        user?.preferences?.dailyCalorieGoal ?? 2000  // Default to 2000 if not set or user is nil
    }
    
    func addWeeklyDietEntry(startDate: String, meals: [Meal] = []) {
        let newDietEntry = DietEntry()
        newDietEntry.date = startDate
        newDietEntry.meals.append(objectsIn: meals)
        
        do {
            try realm.write {
                realm.add(newDietEntry)
            }
            loadDietEntriesFromRealm()
        } catch {
            print("Error adding DietEntry to Realm: \(error.localizedDescription)")
        }
    }
    
    func totalCalories(for date: String) -> Int {
        dietEntries.first(where: { $0.date == date })?.meals.reduce(0) { $0 + $1.calories } ?? 0
    }

    func totalProtein(for date: String) -> Int {
        dietEntries.first(where: { $0.date == date })?.meals.reduce(0) { $0 + $1.protein } ?? 0
    }

    func totalCarbs(for date: String) -> Int {
        dietEntries.first(where: { $0.date == date })?.meals.reduce(0) { $0 + $1.carbs } ?? 0
    }

    func totalFats(for date: String) -> Int {
        dietEntries.first(where: { $0.date == date })?.meals.reduce(0) { $0 + $1.fats } ?? 0
    }

    func dayName(for entry: DietEntry) -> String {
        DateUtils.dayName(from: entry.date)
    }
}
