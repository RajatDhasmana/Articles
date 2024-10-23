//
//  ArticleCellView.swift
//  Articles
//
//  Created by Rajat Dhasmana on 23/10/24.
//

import SwiftUI

struct ArticleCellView: View {
    
    private let article: Article

    init(article: Article) {
        self.article = article
    }
    
    var body: some View {
        HStack {
            Image("")
                .resizable()
                .background(Color.gray)
                .frame(width: 40, height: 40)
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 5) {
                Text(article.title)
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .lineLimit(1)
                
                // Author and date information
                HStack(alignment: .bottom) {
                    Text(article.byline)
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    // Date information with calendar icon
                    HStack(spacing: 5) {
                        Image(systemName: "calendar")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text(article.publishedDate)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding([.leading, .trailing], 10)
            
            Spacer()
            
            // Chevron icon on the right
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
    }
}

#Preview {
    ArticleCellView(article: Article(url: "", id: 0, publishedDate: "", byline: "", title: "", abstract: "", media: []))
}
