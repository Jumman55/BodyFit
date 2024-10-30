//
//  DietViewModel.swift
//  BodyFit
//
//  Created by Jumman Hossen on 28/10/24.
//

import Foundation

class DietViewModel: ObservableObject {
    @Published var dietEntries: [DietEntry] = []
    
    init() {
        loadDietEntries()
    }
    
    private func loadDietEntries() {
        guard let url = Bundle.main.url(forResource: "DietEntry", withExtension: "json") else {
            print("DietEntry.json file not found.")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let loadedEntries = try JSONDecoder().decode([DietEntry].self, from: data)
            self.dietEntries = loadedEntries
            print("Diet entries loaded successfully.")
        } catch {
            print("Error loading diet entries: \(error)")
        }
    }
    
    // Example function to calculate total calories for a specific date
    func totalCalories(for date: String) -> Int {
        return dietEntries.first(where: { $0.date == date })?.meals.reduce(0) { $0 + $1.calories } ?? 0
    }
}
