//
//  HomeItemView.swift
//  Terreza
//
//  Created by Saud Syed on 01/10/2024.
//

import SwiftUI

struct HomeItemView: View {
    
    let appetizerData: AppetizerData
    
    var body: some View {
        HStack() {
            RemoteImageView(urlString: appetizerData.imageURL)
                .modifier(ItemImageStyle())
//            AsyncImage(url: URL(string: appetizerData.imageURL)) { image in
//                image
//                    .resizable()
//                    .modifier(ItemImageStyle())
//            } placeholder: {
//                Image("food-placeholder")
//                    .resizable()
//                    .modifier(ItemImageStyle())
//            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(appetizerData.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("$\(appetizerData.price, specifier: "%.2f")")
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    HomeItemView(appetizerData: MockData.sampleAppetizer)
}
