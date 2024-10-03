//
//  AccountViewModel.swift
//  Terreza
//
//  Created by Saud Syed on 02/10/2024.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @AppStorage("user") private var userData: Data?
    @Published var user = UserData()
    
    @Published var alertItem: AlertItem?
    
    private var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false }
        
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
    
    //MARK: - saveChangeTapped()
    func saveChangeTapped() {
        guard isValidForm else { return }
        
        do {
            let user = try JSONEncoder().encode(user)
            userData = user
            alertItem = AlertContext.userSaveSuccess
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
    //MARK: - retrieveUserData()
    func retrieveUserData() {
        guard let userData = userData else { return }
        
        do {
            let user = try JSONDecoder().decode(UserData.self, from: userData)
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
}
