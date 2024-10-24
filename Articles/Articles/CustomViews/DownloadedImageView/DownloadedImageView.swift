//
//  DownloadedImageView.swift
//  Articles
//
//  Created by Rajat Dhasmana on 23/10/24.
//

import SwiftUI

struct DownloadedImageView: View {
    
    @StateObject private var viewModel: DownloadedImageViewModel
    
    init(urlString: String) {
        _viewModel = StateObject(wrappedValue: DownloadedImageViewModel(
            urlStr: urlString,
            imageDownloadService: DownloadedImageService()))
    }
    
    var body: some View {
        
        ZStack {
            
            switch viewModel.viewState {
            case .failure, .loading:
                ProgressView()
                
            case .success(let image):
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
        }
        .onAppear {
            viewModel.perform(action: .didAppear)
        }
    }
}

#Preview {
    DownloadedImageView(urlString: "")
}
