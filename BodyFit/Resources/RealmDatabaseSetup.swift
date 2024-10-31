//
//  RealmDatabaseSetup.swift
//  BodyFit
//
//  Created by Jumman Hossen on 31/10/24.
//

import RealmSwift

func initializeDefaultUser() {
    let realm = try! Realm()
    
    // Check if a user already exists
    if realm.objects(User.self).isEmpty {
        // Set up default preferences
        let preferences = Preferences(
            dailyCalorieGoal: 2600,
            proteinGoal: 160.0,
            carbGoal: 250.0,
            fatGoal: 70.0,
            measurementUnit: "kg"
        )

        // Create the default user
        let user = User(
            name: "Jumman",
            gender: "Male",
            age: 25,
            height: 173.0,
            weight: 70.0,
            activityLevel: "Moderate",
            goal: "Maintain Weight",
            preferences: preferences
        )

        // Save the user to Realm
        try! realm.write {
            realm.add(user)
        }
    }
}
