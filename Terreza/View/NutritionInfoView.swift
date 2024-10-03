//
//  NutritionInfoView.swift
//  Terreza
//
//  Created by Saud Syed on 02/10/2024.
//

import SwiftUI

struct NutritionInfoView: View {
    
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .bold()
                .font(.caption)
            
            Text(value)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
                .italic()
        }
    }
}

#Preview {
    NutritionInfoView(title: "Calories", value: "90")
}
