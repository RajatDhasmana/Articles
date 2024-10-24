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
            switch viewmodel.viewState {
            case .loading:
                    ProgressView()
                
            case .noResponseReceived, .emptyData:
                    EmptyStateView()
                
            case .dataReceived:
                LazyVStack(spacing: 10) {
                    ForEach(viewmodel.articleList, id: \.id) { article in
                        NavigationLink(
                            destination: ArticleDetailView(article: article)
                        ) {
                            ArticleCellView(article: article)
                        }
                    }
                }
            }
        }
        .withCustomNavBar(title: viewmodel.viewConstants.navTitle)
        .onAppear(perform: {
            viewmodel.perform(action: .didAppear)
        })
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ArticleListView(viewmodel: ArticleListViewModel(service: ArticleListViewService.live))
}
