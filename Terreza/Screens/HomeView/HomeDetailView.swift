//
//  HomeDetailView.swift
//  Terreza
//
//  Created by Saud Syed on 02/10/2024.
//

import SwiftUI

struct HomeDetailView: View {
    
    @EnvironmentObject var order: Order
    
    @Binding var isShowingDetailView: Bool
    let appetizerData: AppetizerData
    
    var body: some View {
        VStack {
            RemoteImageView(urlString: appetizerData.imageURL)
                .modifier(DetailImageStyle())
//            AsyncImage(url: URL(string: appetizerData.imageURL)) { image in
//                image
//                    .resizable()
//                    .modifier(DetailImageStyle())
//
//            } placeholder: {
//                Image("food-placeholder")
//                    .resizable()
//                    .modifier(DetailImageStyle())
//            }
            
            Text(appetizerData.name)
                .font(.title2)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding([.leading, .trailing], 8)
            
            Text(appetizerData.description)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
            
            HStack(spacing: 45) {
                NutritionInfoView(title: "Calories", value: "\(appetizerData.calories)")
                NutritionInfoView(title: "Carbs", value: "\(appetizerData.carbs) g")
                NutritionInfoView(title: "Protein", value: "\(appetizerData.protein) g")
            }
            
            Spacer()
            
            Button(action: {
                order.addToCart(appetizerData)
                withAnimation {
                    isShowingDetailView.toggle()
                }
            }, label: {
                Text("$\(appetizerData.price, specifier: "%.2f") - Add To Order")
            })
            .modifier(StandardButtonStyle())
            .padding(.bottom, 25)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .clipShape(.rect(cornerRadius: 12))
        .shadow(radius: 40)
        .animation(.spring(), value: isShowingDetailView)
        .overlay (alignment: .topTrailing) {
            Button(action: {
                withAnimation {
                    isShowingDetailView.toggle()
                }
            }, label: {
                XDismissButton()
            })
        }
    }
}

#Preview {
    HomeDetailView(isShowingDetailView: .constant(false), appetizerData: MockData.sampleAppetizer)
}
