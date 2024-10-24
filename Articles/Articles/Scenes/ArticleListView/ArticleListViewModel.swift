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
    var viewConstants = ViewConstant()
    
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
                    self?.viewState = .failure(errorStateViewModel)
                }
            } receiveValue: { [weak self] articleResponse in
                if articleResponse.results.isEmpty {
                    let emptyStateViewModel = EmptyStateViewModel(emptyStateText: AppConstant.emptyDataViewText.rawValue) {
                        self?.perform(action: .retry)
                    }
                    self?.viewState = .emptyData(emptyStateViewModel)
                } else {
                    self?.viewState = .dataReceived(articleResponse.results)
                }
            }
            .store(in: &cancellables)
    }
}

extension ArticleListViewModel {
    enum ViewState: Equatable {
        case loading
        case failure(ErrorStateViewModel)
        case dataReceived([Article])
        case emptyData(EmptyStateViewModel)
    }
    
    enum ArticleListViewActions {
        case didAppear
        case retry
    }
    
    struct ViewConstant {
        let navTitle = "NY Times Most Popular"
    }
}
