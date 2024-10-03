//
//  Endpoints.swift
//  Terreza
//
//  Created by Saud Syed on 01/10/2024.
//

import Foundation

enum Endpoints {
    case appetizers
    
    var stringValue: String {
        switch self {
        case .appetizers:
            return "appetizers"
        }
    }
}
