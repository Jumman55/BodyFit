//
//  WorkoutRecommendationView.swift
//  BodyFit
//
//  Created by Jumman Hossen on 01/11/24.
//

import SwiftUI

struct WorkoutRecommendationView: View {
    @StateObject private var viewModel = WorkoutViewModel()
    @State private var selectedWorkoutType = "Push"  // Default selection

    var body: some View {
        VStack {
            Text("Workout Recommendations")
                .font(.largeTitle)
                .padding()

            Picker("Select Workout Type", selection: $selectedWorkoutType) {
                ForEach(["Push", "Pull", "Leg", "Cardio", "Cycling"], id: \.self) { type in
                    Text(type)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            Button(action: {
                viewModel.getRecommendation(for: selectedWorkoutType)
            }) {
                Text("Get Recommendation")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            if let workout = viewModel.recommendedWorkout {
                VStack(alignment: .leading) {
                    Text("Recommended Workout:")
                        .font(.title2)
                        .padding(.top)
                    
                    Text("Workout Type: \(workout.type)")
                    ForEach(workout.exercises, id: \.self) { exercise in
                        Text("• \(exercise)")
                    }
                }
                .padding()
            }
        }
        .padding()
    }
}

#Preview {
    WorkoutRecommendationView()
}
