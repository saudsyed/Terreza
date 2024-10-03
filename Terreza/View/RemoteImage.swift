//
//  RemoteImage.swift
//  Terreza
//
//  Created by Saud Syed on 02/10/2024.
//

import SwiftUI

//MARK: - class ImageLoader
final class ImageLoader: ObservableObject {
    @Published var image: Image? = nil
    
    func load(fromURLString urlString: String) {
        NetworkManager.shared.downloadImage(fromURLString: urlString) { [weak self] uiImage in
            guard let uiImage = uiImage else { return }
            guard let strongSelf = self else { return }
            DispatchQueue.main.async {
                strongSelf.image = Image(uiImage: uiImage)
            }
        }
    }
}

//MARK: - struct RemoteImage
struct RemoteImage: View {
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}

//MARK: - struct RemoteImageView
struct RemoteImageView: View {
    
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear {
                imageLoader.load(fromURLString: urlString)
            }
    }
}
