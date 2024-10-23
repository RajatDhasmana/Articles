//
//  DownloadedImageView.swift
//  Articles
//
//  Created by Rajat Dhasmana on 23/10/24.
//

import SwiftUI

struct DownloadedImageView: View {
    
    @ObservedObject private var viewmodel: DownloadedImageViewModel
    
    init(image: UIImage? = nil, urlString: String? = nil) {
        
        viewmodel = DownloadedImageViewModel(
            image: image,
            urlStr: urlString,
            imageDownloadService: DownloadedImageService())
    }
    
    var body: some View {
        
        ZStack {
            
            if let image = viewmodel.image {
                Image(uiImage: image)
                    .resizable()
            }
            if viewmodel.showLoader {
                ProgressView()
            }
        }
        .onAppear {
            viewmodel.perform(action: .didAppear)
        }
    }
}

#Preview {
    DownloadedImageView()
}
