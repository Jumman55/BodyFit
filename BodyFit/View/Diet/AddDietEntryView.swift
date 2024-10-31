//
//  AddDietEntryView.swift
//  BodyFit
//
//  Created by Jumman Hossen on 30/10/24.
//

import SwiftUI

struct AddDietEntryView: View {
    @ObservedObject var viewModel: DietViewModel
    @State private var selectedMealType = "Breakfast"
    @State private var mealDescription = ""
    @State private var calories = ""
    @State private var protein = ""
    @State private var carbs = ""
    @State private var fats = ""
    @Environment(\.dismiss) private var dismiss

    private let mealTypes = ["Breakfast", "Lunch", "Dinner", "Snack", "Evening Snack"]

    var body: some View {
        ZStack {
            // Background Gradient
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(hex: "#0F2027"),
                    Color(hex: "#203A43"),
                    Color(hex: "#2C5364")
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 20) {
                Text("Add Diet Entry")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.top, 30)

                VStack(spacing: 15) {
                    GlassPicker(selection: $selectedMealType, options: mealTypes, title: "Meal Type")
                    GlassTextField(placeholder: "Meal Description", text: $mealDescription)
                    GlassTextField(placeholder: "Calories", text: $calories)
                    GlassTextField(placeholder: "Protein (g)", text: $protein)
                    GlassTextField(placeholder: "Carbs (g)", text: $carbs)
                    GlassTextField(placeholder: "Fats (g)", text: $fats)
                }
                .padding()
                .background(Color.black.opacity(0.2))
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white.opacity(0.3), lineWidth: 1)
                )
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 5, y: 5)
                .padding(.horizontal, 20)

                Button(action: addDietEntry) {
                    Text("Add Entry")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 10)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
            }
        }
    }

    private func addDietEntry() {
        guard let calorieValue = Int(calories),
              let proteinValue = Int(protein),
              let carbsValue = Int(carbs),
              let fatsValue = Int(fats) else {
            return
        }
        
        let meal = Meal()
        meal.type = selectedMealType
        meal.mealDescription = mealDescription
        meal.calories = calorieValue
        meal.protein = proteinValue
        meal.carbs = carbsValue
        meal.fats = fatsValue
        
        viewModel.addWeeklyDietEntry(startDate: DateUtils.currentDateString(), meals: [meal])
        
        dismiss()
    }
}

// MARK: - GlassPicker and GlassTextField Components

struct GlassPicker: View {
    @Binding var selection: String
    let options: [String]
    let title: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.7))
            Picker(selection: $selection, label: Text("")) {
                ForEach(options, id: \.self) { option in
                    Text(option).tag(option)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .background(Color.black.opacity(0.15))
            .cornerRadius(10)
            .padding(.top, 5)
        }
    }
}

struct GlassTextField: View {
    var placeholder: String
    @Binding var text: String

    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(.white.opacity(0.5))
                    .padding(.leading, 10)
            }
            TextField("", text: $text)
                .padding()
                .background(Color.black.opacity(0.15))
                .cornerRadius(10)
                .foregroundColor(.white)
        }
    }
}

#Preview {
    AddDietEntryView(viewModel: DietViewModel())
}
