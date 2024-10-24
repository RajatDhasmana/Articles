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
            getArticleLis()
        case .retry:
            getArticleLis()
        }
    }
    
    private func getArticleLis() {
        viewState = .loading
        service.fetchArticles()
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    let errorStateViewModel = ErrorStateViewModel(error: error) {
                        self?.perform(action: .retry)
                    }
                    self?.viewState = .failure(errorStateViewModel: errorStateViewModel)
                }
            } receiveValue: { [weak self] articleResponse in
                self?.viewState = .dataReceived(articleResponse.results)
            }
            .store(in: &cancellables)
    }
}

extension ArticleListViewModel {
    enum ViewState {
        case loading
        case failure(errorStateViewModel: ErrorStateViewModel)
        case dataReceived([Article])
    }
    
    enum ArticleListViewActions {
        case didAppear
        case retry
    }
    
    struct Constant {
        let navTitle = "NY Times Most Popular"
    }
}
