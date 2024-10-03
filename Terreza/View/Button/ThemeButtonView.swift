//
//  ThemeButtonView.swift
//  Terreza
//
//  Created by Saud Syed on 02/10/2024.
//

import SwiftUI

struct ThemeButtonView: View {
    
    let title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.medium)
            .frame(width: 260, height: 50)
            .background(.themePrimary)
            .foregroundStyle(.white)
            .clipShape(.buttonBorder)
    }
}

#Preview {
    ThemeButtonView(title: "Title")
}
