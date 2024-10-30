//
//  MainDashboardView.swift
//  BodyFit
//
//  Created by Jumman Hossen on 28/10/24.
//

import SwiftUI

struct MainDashboardView: View {
    @StateObject private var viewModel = MainDashboardViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Diet Summary Card
                    NavigationLink(destination: DietTrackingView()) {
                        SummaryCardView(
                            title: "Diet Tracking",
                            value: "\(viewModel.caloriesConsumed) / \(viewModel.calorieTarget) kcal",
                            description: "Today's Calorie Intake"
                        )
                    }
                    
                    // Workout Summary Card
                    NavigationLink(destination: WorkoutTrackingView()) {
                        SummaryCardView(
                            title: "Workout Tracking",
                            value: "\(viewModel.workoutsCompleted) / \(viewModel.totalWorkouts)",
                            description: "Workouts This Week"
                        )
                    }
                    
                    // Weekly Analysis Card
                    NavigationLink(destination: WeeklyAnalysisView()) {
                        SummaryCardView(
                            title: "Weekly Analysis",
                            value: "View Summary",
                            description: "Diet & Workout Progress"
                        )
                    }
                    
                    // Progress Tracking Card
                    NavigationLink(destination: ProgressTrackingView()) {
                        SummaryCardView(
                            title: "Progress Tracking",
                            value: "View Details",
                            description: "Physical Progress Over Time"
                        )
                    }
                }
                .padding()
                .navigationTitle("Dashboard")
            }
        }
    }
}

#Preview {
    MainDashboardView()
}
