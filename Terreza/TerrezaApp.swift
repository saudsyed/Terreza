//
//  TerrezaApp.swift
//  Terreza
//
//  Created by Saud Syed on 01/10/2024.
//

import SwiftUI

@main
struct TerrezaApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(order)
        }
    }
}
