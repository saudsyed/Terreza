//
//  UserModel.swift
//  Terreza
//
//  Created by Saud Syed on 02/10/2024.
//

import Foundation

struct UserData: Codable {
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var birthday = Date()
    var isExtraNapkins = false
    var isFrequentlyRefill = false
}
