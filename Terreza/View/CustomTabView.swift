//
//  TabView.swift
//  Terreza
//
//  Created by Saud Syed on 01/10/2024.
//

import SwiftUI

struct CustomTabView: View {
    
    @EnvironmentObject var order: Order
            
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }
                .badge(order.items.count)
        }
        .tint(.themePrimaryColor)
    }
}

#Preview {
    CustomTabView()
}
