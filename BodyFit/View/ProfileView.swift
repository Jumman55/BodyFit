//
//  ProfileView.swift
//  BodyFit
//
//  Created by Jumman Hossen on 28/10/24.
//

//import SwiftUI
//
//struct ProfileView: View {
//    // Create an instance of ProfileViewModel for the view to observe
//    @StateObject private var viewModel = ProfileViewModel()
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 15) {
//            if let user = viewModel.user {
//                // Display user details if data is loaded successfully
//                Text("Name: \(user.name)")
//                Text("Age: \(user.age)")
//                Text("Height: \(user.height) cm")
//                Text("Weight: \(user.weight) kg")
//                Text("Goal: \(user.goal)")
//                Text("Daily Calorie Goal: \(user.preferences.dailyCalorieGoal) kcal")
//            } else {
//                // Show a loading message while data is being loaded
//                Text("Loading user data...")
//            }
//        }
//        .padding()
//        .navigationTitle("Profile")
//    }
//}
//
//#Preview {
//    ProfileView()
//}
