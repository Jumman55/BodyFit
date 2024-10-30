//
//  AddDietEntryView.swift
//  BodyFit
//
//  Created by Jumman Hossen on 30/10/24.
//

import SwiftUI

struct AddDietEntryView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: DietViewModel

    @State private var date = Date()
    @State private var calorieTarget = ""
    @State private var meals: [Meal] = []
    
    // Input fields for a new meal
    @State private var mealName = ""
    @State private var calories = ""    // Changed to @State and String
    @State private var protein = ""     // Changed to @State and String
    @State private var carbs = ""       // Changed to @State and String
    @State private var fats = ""        // Changed to @State and String

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Date and Calorie Target")) {
                    DatePicker("Date", selection: $date, displayedComponents: .date)
                    TextField("Calorie Target", text: $calorieTarget)
                        .keyboardType(.numberPad)
                }

                Section(header: Text("Add a Meal")) {
                    TextField("Meal Name", text: $mealName)
                    TextField("Calories", text: $calories)
                        .keyboardType(.numberPad)
                    TextField("Protein (g)", text: $protein)
                        .keyboardType(.decimalPad)
                    TextField("Carbs (g)", text: $carbs)
                        .keyboardType(.decimalPad)
                    TextField("Fats (g)", text: $fats)
                        .keyboardType(.decimalPad)
                    Button("Add Meal") {
                        addMeal()
                    }
                }
                
                Section(header: Text("Meals")) {
                    ForEach(meals, id: \.id) { meal in
                        VStack(alignment: .leading) {
                            Text(meal.name)
                            Text("Calories: \(meal.calories), Protein: \(meal.protein)g, Carbs: \(meal.carbs)g, Fats: \(meal.fats)g")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationTitle("Add Diet Entry")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        saveDietEntry()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
    
    private func addMeal() {
        // Convert user inputs to Int and Double where necessary
        guard let caloriesInt = Int(calories),
              let proteinDouble = Double(protein),
              let carbsDouble = Double(carbs),
              let fatsDouble = Double(fats) else { return }

        let newMeal = Meal()
        newMeal.name = mealName
        newMeal.calories = caloriesInt
        newMeal.protein = proteinDouble
        newMeal.carbs = carbsDouble
        newMeal.fats = fatsDouble

        meals.append(newMeal)

        // Clear input fields
        mealName = ""
        calories = ""
        protein = ""
        carbs = ""
        fats = ""
    }

    private func saveDietEntry() {
        guard let calorieTargetInt = Int(calorieTarget) else { return }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: date)

        viewModel.addDietEntry(date: dateString, calorieTarget: calorieTargetInt, meals: meals)
        presentationMode.wrappedValue.dismiss()
    }
}
