//
//  AccountView.swift
//  Terreza
//
//  Created by Saud Syed on 01/10/2024.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section("Personal Info") {
                    TextField("First Name", text: $viewModel.user.firstName)
                    TextField("Last Name", text: $viewModel.user.lastName)
                    TextField("Email", text: $viewModel.user.email)
                    DatePicker("Birthday", selection: $viewModel.user.birthday, displayedComponents: .date)
                    Button("Save Changes") {
                        viewModel.saveChangeTapped()
                    }
                }

                Section("Requests") {
                    Toggle("Extra Napkins", isOn: $viewModel.user.isExtraNapkins)
                    Toggle("Frequently Refill", isOn: $viewModel.user.isFrequentlyRefill)
                }
                .toggleStyle(SwitchToggleStyle(tint: .themePrimary))
            }
            .navigationTitle("Account")
        }
        .onAppear {
            viewModel.retrieveUserData()
        }
        .alert(item: $viewModel.alertItem) { alert in
            Alert(title: alert.title, message: alert.message, dismissButton: alert.dismissButton)
        }
    }
}

#Preview {
    AccountView()
}
