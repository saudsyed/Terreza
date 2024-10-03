//
//  OrderView.swift
//  Terreza
//
//  Created by Saud Syed on 01/10/2024.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { data in
                            HomeItemView(appetizerData: data)
                        }
                        .onDelete(perform: order.deleteItem)
                    }
                    
                    Button(action: {
                        
                    }, label: {
                        ThemeButtonView(title: "$\(order.totalPrice, specifier: "%.2f") - Place Order")
                    })
                    .padding(.bottom, 25)
                }
                .listStyle(.plain)
                
                if order.items.isEmpty {
                    EmptyStateView(imageName: "empty-order", message: "Order somthing! You have empty cart")
                }
            }
            .navigationTitle("Order")
        }
    }
}

#Preview {
    OrderView()
}
