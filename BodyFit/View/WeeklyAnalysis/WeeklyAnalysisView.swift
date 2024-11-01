//
//  WeeklyAnalysisView.swift
//  BodyFit
//
//  Created by Jumman Hossen on 28/10/24.
//

//import SwiftUI
//import Charts
//
//struct WeeklyAnalysisView: View {
//    @StateObject private var viewModel = WeeklyAnalysisViewModel()
//
//    var body: some View {
//        ScrollView {
//            VStack(alignment: .leading, spacing: 25) {
//                Text("Weekly Analysis")
//                    .font(.largeTitle)
//                    .bold()
//                    .padding(.bottom, 20)
//                
//                // Calories Intake Chart
//                VStack(alignment: .leading) {
//                    Text("Calories Intake")
//                        .font(.headline)
//                    Chart(viewModel.dailySummaries) { summary in
//                        BarMark(
//                            x: .value("Day", summary.day),
//                            y: .value("Calories", summary.calories)
//                        )
//                        .foregroundStyle(summary.calories > viewModel.calorieTarget ? .red : .blue)
//                        .annotation(position: .top) { // Display values on top of bars
//                            Text("\(summary.calories) kcal")
//                                .font(.caption)
//                        }
//
//                        RuleMark(y: .value("Calorie Target", viewModel.calorieTarget))
//                            .foregroundStyle(.gray)
//                            .lineStyle(StrokeStyle(dash: [5]))
//                            .annotation(position: .top, alignment: .leading) {
//                                Text("Target")
//                                    .font(.caption)
//                                    .foregroundColor(.gray)
//                            }
//                    }
//                    .frame(height: 200)
//                }
//
//                // Protein Chart
//                VStack(alignment: .leading) {
//                    Text("Protein Intake")
//                        .font(.headline)
//                    Chart(viewModel.dailySummaries) { summary in
//                        BarMark(
//                            x: .value("Day", summary.day),
//                            y: .value("Protein", summary.protein)
//                        )
//                        .foregroundStyle(.green)
//                        .annotation(position: .top) {
//                            Text("\(String(format: "%.2f", summary.protein)) g")
//                                .font(.caption)
//                        }
//                    }
//                    .frame(height: 150)
//                }
//
//                // Carbs Chart
//                VStack(alignment: .leading) {
//                    Text("Carbs Intake")
//                        .font(.headline)
//                    Chart(viewModel.dailySummaries) { summary in
//                        BarMark(
//                            x: .value("Day", summary.day),
//                            y: .value("Carbs", summary.carbs)
//                        )
//                        .foregroundStyle(.yellow)
//                        .annotation(position: .top) {
//                            Text("\(String(format: "%.2f", summary.carbs)) g")
//                                .font(.caption)
//                        }
//                    }
//                    .frame(height: 150)
//                }
//
//                // Fats Chart
//                VStack(alignment: .leading) {
//                    Text("Fats Intake")
//                        .font(.headline)
//                    Chart(viewModel.dailySummaries) { summary in
//                        BarMark(
//                            x: .value("Day", summary.day),
//                            y: .value("Fats", summary.fats)
//                        )
//                        .foregroundStyle(.purple)
//                        .annotation(position: .top) {
//                            Text("\(String(format: "%.2f", summary.fats)) g")
//                                .font(.caption)
//                        }
//                    }
//                    .frame(height: 150)
//                }
//
//                // Workout Frequency Chart
//                VStack(alignment: .leading) {
//                    Text("Workout Frequency")
//                        .font(.headline)
//                    Chart(viewModel.dailySummaries) { summary in
//                        PointMark(
//                            x: .value("Day", summary.day),
//                            y: .value("Workout", summary.workoutsCompleted ? 1 : 0)
//                        )
//                        .symbol(summary.workoutsCompleted ? .circle : .square)
//                        .foregroundStyle(summary.workoutsCompleted ? .blue : .gray)
//                        .annotation(position: .top) {
//                            Text(summary.workoutsCompleted ? "✔︎" : "✖︎")
//                                .font(.caption)
//                        }
//                    }
//                    .frame(height: 100)
//                }
//
//                Spacer()
//            }
//            .padding()
//            .navigationTitle("Weekly Analysis")
//        }
//    }
//}
//
//#Preview {
//    WeeklyAnalysisView()
//}
