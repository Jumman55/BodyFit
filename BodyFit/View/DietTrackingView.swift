//
//  DietTrackingView.swift
//  BodyFit
//
//  Created by Jumman Hossen on 28/10/24.
//

import SwiftUI

struct DietTrackingView: View {
    @StateObject private var viewModel = DietViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.dietEntries) { entry in
                Section(header: Text("Date: \(entry.date)")) {
                    ForEach(entry.meals) { meal in
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
        }
    }
}

#Preview {
    DietTrackingView()
}
