//
//  WorkoutRecommendationView.swift
//  BodyFit
//
//  Created by Jumman Hossen on 01/11/24.
//

import SwiftUI

struct WorkoutRecommendationView: View {
    @StateObject private var viewModel = WorkoutRecommendationViewModel()
    @State private var selectedWorkoutType = "Push"
    private let workoutTypes = ["Push", "Pull", "Leg", "Cardio", "Cycling"]

    var body: some View {
        VStack(spacing: 20) {
            Text("Workout Recommendations")
                .font(.largeTitle)
                .bold()
                .padding()

            // Picker for workout type selection
            Picker("Select Workout Type", selection: $selectedWorkoutType) {
                ForEach(workoutTypes, id: \.self) { type in
                    Text(type)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            // Button to fetch the recommendation
            Button(action: {
                viewModel.getRecommendation(for: selectedWorkoutType)  // Pass the selected type
            }) {
                Text("Get Recommendation")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 10)
            }
            .padding(.horizontal, 20)

            // Display the recommended workout
            Text(viewModel.recommendedWorkout)
                .font(.title2)
                .bold()
                .foregroundColor(.green)
                .padding()

            // Button to reset the weekly plan
            Button(action: {
                viewModel.resetWeeklyPlan()
            }) {
                Text("Reset Weekly Plan")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
            }
            .padding(.top, 10)
        }
        .padding()
    }
}

#Preview {
    WorkoutRecommendationView()
}
