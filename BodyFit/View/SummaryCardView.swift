//
//  SummaryCardView.swift
//  BodyFit
//
//  Created by Jumman Hossen on 30/10/24.
//

import SwiftUI

struct SummaryCardView: View {
    var title: String
    var value: String
    var description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.headline)
            Text(value)
                .font(.title)
                .bold()
                .foregroundColor(.blue)
            Text(description)
                .font(.footnote)
                .foregroundColor(.gray)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .shadow(radius: 3)
    }
}

#Preview {
    SummaryCardView(title: "Diet Tracking", value: "1800 / 2500 kcal", description: "Today's Calorie Intake")
}
