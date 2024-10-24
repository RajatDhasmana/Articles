//
//  ArticleDetailView.swift
//  Articles
//
//  Created by Rajat Dhasmana on 23/10/24.
//

import SwiftUI

struct ArticleDetailView: View {
    
    let viewModel: ArticleDetailViewModel

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(spacing: 16) {
                    
                    DownloadedImageView(urlString: viewModel.article.imageUrlStr ?? "")
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.3)
                        .clipped()
                    
                    Text(viewModel.article.title)
                        .padding(.horizontal)
                    Text(viewModel.article.abstract)
                        .padding(.horizontal)

                    HStack(spacing: 5) {
                        Image(systemName: "calendar")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text(viewModel.article.publishedDate)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal)
                }
            }
        }
        .navigationTitle(viewModel.viewConstants.navTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let article = Article(url: "", id: 0, publishedDate: "", byline: "", title: "", abstract: "", media: [])
    return ArticleDetailView(viewModel: .init(article: article))
}
