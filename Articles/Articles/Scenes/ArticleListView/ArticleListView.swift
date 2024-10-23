//
//  ArticleListView.swift
//  Articles
//
//  Created by Rajat Dhasmana on 23/10/24.
//

import SwiftUI

struct ArticleListView: View {
    
    @StateObject var viewmodel: ArticleListViewModel

    var body: some View {
        
        ScrollView {
            
            if viewmodel.showLoader {
                ZStack {
                    ProgressView()
                }
            } else {
                LazyVStack(spacing: 10) {
                    ForEach(viewmodel.articleList, id: \.id) { article in
                        ArticleCellView(article: article)
                        .padding()
                    }
                }
            }
        }
        .withCustomNavBar(title: "NY Times Most Popular")
        .onAppear(perform: {
            viewmodel.perform(action: .didAppear)
        })
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ArticleListView(viewmodel: ArticleListViewModel(service: ArticleListViewService.live))
}
