//
//  HomeView.swift
//  Terreza
//
//  Created by Saud Syed on 01/10/2024.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = AppetizerViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.appetizerList) { appetizer in
                    HomeItemView(appetizerData: appetizer)
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            withAnimation(.spring()) {
                                viewModel.isShwoingDetailView.toggle()
                            }
                        }
                }
                .listStyle(.plain)
                .navigationTitle("Menu")
                .disabled(viewModel.isShwoingDetailView)
            }
            .onAppear {
                viewModel.getAppetizerListApi()
            }
            .blur(radius: viewModel.isShwoingDetailView ? 20 : 0)
            
            if viewModel.isShwoingDetailView {
                HomeDetailView(isShowingDetailView: $viewModel.isShwoingDetailView, appetizerData: viewModel.selectedAppetizer!)
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alert in
            Alert(title: alert.title, message: alert.message, dismissButton: alert.dismissButton)
        }
    }
}

#Preview {
    HomeView()
}
