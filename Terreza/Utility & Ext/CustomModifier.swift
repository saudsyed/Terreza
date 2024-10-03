//
//  CustomModifier.swift
//  Terreza
//
//  Created by Saud Syed on 03/10/2024.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.themePrimaryColor)
            .controlSize(.large)
    }
}

struct DetailImageStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .aspectRatio(contentMode: .fit)
            .frame(width: 300, height: 225)
    }
}

struct ItemImageStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .aspectRatio(contentMode: .fit)
            .frame(width: 120, height: 90)
            .clipShape(.buttonBorder)
    }
}
