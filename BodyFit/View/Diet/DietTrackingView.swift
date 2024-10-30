//
//  DietTrackingView.swift
//  BodyFit
//
//  Created by Jumman Hossen on 28/10/24.
//

import SwiftUI

struct DietTrackingView: View {
    @StateObject private var viewModel = DietViewModel()
    @State private var showingAddEntryView = false  // State variable to control sheet presentation

    var body: some View {
        NavigationView {
            List(viewModel.dietEntries) { entry in
                Section(header: Text("Date: \(entry.date)")) {
                    ForEach(entry.meals, id: \.id) { meal in
                        VStack(alignment: .leading) {
                            Text(meal.name)
                                .font(.headline)
                            Text("Calories: \(meal.calories) | Protein: \(meal.protein)g | Carbs: \(meal.carbs)g | Fats: \(meal.fats)g")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical, 4)
                    }
                    Text("Calorie Target: \(entry.calorieTarget) kcal")
                        .font(.footnote)
                        .foregroundColor(.blue)
                        .padding(.top, 5)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Diet Tracker")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        showingAddEntryView = true  // Show the sheet
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddEntryView) {  // Present AddDietEntryView as a sheet
                AddDietEntryView(viewModel: viewModel)
            }
        }
    }
}

#Preview {
    DietTrackingView()
}
