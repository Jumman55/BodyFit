//
//  WorkoutTrackingView.swift
//  BodyFit
//
//  Created by Jumman Hossen on 28/10/24.
//

import SwiftUI

struct WorkoutTrackingView: View {
    @StateObject private var viewModel = WorkoutViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.workouts) { workout in
                Section(header: Text("\(workout.type) Workout")) {
                    ForEach(workout.exercises) { exercise in
                        VStack(alignment: .leading) {
                            Text(exercise.name)
                                .font(.headline)
                            Text("Sets: \(exercise.sets) | Reps: \(exercise.reps) | Weight: \(exercise.weight) kg")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Workout Tracker")
        }
    }
}

#Preview {
    WorkoutTrackingView()
}
