//
//  Order.swift
//  Terreza
//
//  Created by Saud Syed on 03/10/2024.
//

import SwiftUI

final class Order: ObservableObject {
    
    @Published var items: [AppetizerData] = []
    
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price }
    }
    
    //MARK: - addToCart()
    func addToCart(_ appetizer: AppetizerData) {
        items.append(appetizer)
    }
    
    //MARK: - deleteItem()
    func deleteItem(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}
