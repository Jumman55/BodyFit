//
//  DietTrackingView.swift
//  BodyFit
//
//  Created by Jumman Hossen on 28/10/24.
//

import SwiftUI

struct DietTrackingView: View {
    @StateObject private var viewModel = DietViewModel()
    @State private var showingAddEntryView = false

    var body: some View {
        ZStack {
            BackgroundView() // Substruct for the background gradient
            
            VStack {
                HeaderView(title: "Diet Tracker") // Header for the title
                
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(viewModel.dietEntries) { entry in
                            GlassCardView(entry: entry) // Substruct for the glass card
                        }
                    }
                    .padding(.vertical, 10)
                }
                
                Spacer()
            } // Main VStack content
            
            // Floating Plus Button
            FloatingAddButton(action: {
                showingAddEntryView.toggle()
            })
            .sheet(isPresented: $showingAddEntryView) {
                AddDietEntryView(viewModel: viewModel)
            }
        } // ZStack for entire view
    }
}

// MARK: - Substructs for Modular Code

// Background gradient view
struct BackgroundView: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color(hex: "#0F2027"),  // Dark blue
                Color(hex: "#203A43"),  // Mid-tone blue
                Color(hex: "#2C5364")   // Soft teal
            ]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }
}

// Header view with title
struct HeaderView: View {
    let title: String
    var body: some View {
        Text(title)
            .font(.largeTitle)
            .bold()
            .foregroundColor(.white)
            .padding(.top, 40)
    }
}

// Glass card view for diet entries
struct GlassCardView: View {
    let entry: DietEntry
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("\(DateUtils.dayName(from: entry.date)), Date: \(entry.date)")
                .font(.headline)
                .foregroundColor(.white)
            
            ForEach(entry.meals, id: \.id) { meal in
                MealDetailView(meal: meal) // Substruct for meal details
            }
        }
        .padding()
        .background(Color.black.opacity(0.2))  // Semi-transparent black for glass effect
        .cornerRadius(15)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.white.opacity(0.2), lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 5, y: 5)
        .shadow(color: Color.black.opacity(0.5), radius: 20, x: -5, y: -5)
        .padding(.horizontal, 16)
    }
}

// Detailed view for each meal
struct MealDetailView: View {
    let meal: Meal
    var body: some View {
        VStack(alignment: .leading) {
            Text(meal.type)
                .font(.headline)
                .bold()
                .foregroundColor(.white)
            Text(meal.mealDescription)
                .font(.subheadline)
                .bold()
                .foregroundColor(.white.opacity(0.8))
            
            Text("Calories: \(meal.calories) | Protein: \(meal.protein)g | Carbs: \(meal.carbs)g | Fats: \(meal.fats)g")
                .font(.footnote)
                .foregroundColor(.white.opacity(0.7))
        }
    }
}

// Floating action button
struct FloatingAddButton: View {
    let action: () -> Void
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: action) {
                    Image(systemName: "plus")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                        .padding()
                        .background(Circle().fill(Color.blue))
                        .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 10)
                }
                .padding()
            }
        }
    }
}

// MARK: - Preview
#Preview {
    DietTrackingView()
}
