//
//  ArticleListViewModel.swift
//  Articles
//
//  Created by Rajat Dhasmana on 23/10/24.
//

import Foundation
import Combine

internal class ArticleListViewModel: ObservableObject {
        
    // MARK: - Published variables
    @Published var articleList = [Article]()
    @Published var viewState: ViewState = .loading
    
    // MARK: - Private variables
    private let service: ArticleListViewServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    var viewConstants = Constant()

    init(service: ArticleListViewServiceProtocol) {
        self.service = service
    }
}

extension ArticleListViewModel {
    
    func perform(action: ArticleListViewActions) {
        
        switch action {
            
        case .didAppear:
            viewState = .loading
            service.fetchArticles()
                .sink { [weak self] completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let _):
                        self?.viewState = .noResponseReceived
                    }
                } receiveValue: { [weak self] articleResponse in
                    self?.articleList = articleResponse.results

                    if articleResponse.results.isEmpty {
                        self?.viewState = .emptyData
                    } else {
                        self?.viewState = .dataReceived
                    }
                }
                .store(in: &cancellables)
        }
    }
}

extension ArticleListViewModel {
    enum ViewState {
        case loading
        case noResponseReceived
        case dataReceived
        case emptyData
    }
    
    enum ArticleListViewActions {
        case didAppear
    }
    
    struct Constant {
        let navTitle = "NY Times Most Popular"
    }
}
