//
//  AppetizerViewModel.swift
//  Terreza
//
//  Created by Saud Syed on 01/10/2024.
//

import Foundation

final class AppetizerViewModel: ObservableObject {
    
    @Published var appetizerList = [AppetizerData]()
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShwoingDetailView = false
    @Published var selectedAppetizer: AppetizerData?
    
    func getAppetizerListApi() {
        isLoading = true
        NetworkManager.shared.request(endpoint: .appetizers, method: .get) { [weak self] (result: Result<APIResponse<AppetizerResponse>, NetworkError>) in
            guard let strongSelf = self else { return }
            DispatchQueue.main.async {
                strongSelf.isLoading = false
                switch result {
                case .success(let success):
                    strongSelf.appetizerList = success.value.request
                case .failure(let error):
                    switch error {
                    case .decodeFailed(_):
                        strongSelf.alertItem = AlertContext.decodeFailed
                        
                    case .invalidResponse:
                        strongSelf.alertItem = AlertContext.invalidResponse
                        
                    case .requestFailed(_):
                        strongSelf.alertItem = AlertContext.requestFailed
                    }
                }
            }
        }
    }
}
