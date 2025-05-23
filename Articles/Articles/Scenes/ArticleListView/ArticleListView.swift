//
//  ArticleListView.swift
//  Articles
//
//  Created by Rajat Dhasmana on 23/10/24.
//

import SwiftUI

struct ArticleListView: View {
    
    @ObservedObject var viewModel: ArticleListViewModel
    
    var body: some View {
        
        Group {
            switch viewModel.viewState {
            case .loading:
                ProgressView()
                
            case .failure(let errorStateViewModel):
                ErrorStateView(viewModel: errorStateViewModel)
                
            case .emptyData(let emptyStateViewModel):
                EmptyStateView(viewModel: emptyStateViewModel)
                
            case .dataReceived(let articleList):
                ScrollView {
                    LazyVStack(spacing: 10) {
                        ForEach(articleList, id: \.id) { article in
                            NavigationLink(
                                destination: ArticleDetailView(viewModel: .init(article: article))
                            ) {
                                ArticleCellView(article: article)
                            }
                        }
                    }
                }
            }
        }
        .withCustomNavBar(title: viewModel.viewConstants.navTitle)
        .onAppear(perform: {
            viewModel.perform(action: .didAppear)
        })
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ArticleListView(viewModel: ArticleListViewModel(service: ArticleListViewService.live))
}
