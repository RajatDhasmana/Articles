//
//  ArticleListViewModel.swift
//  Articles
//
//  Created by Rajat Dhasmana on 23/10/24.
//

import Foundation
import Combine

internal class ArticleListViewModel: ObservableObject {
    
    enum ArticleListViewActions {
        case didAppear
    }
    
    // MARK: - Published variables
    @Published var showLoader: Bool = true
    @Published var articleList = [Article]()
    
    // MARK: - Private variables
    private let service: ArticleListViewServiceProtocol
    private var cancellables = Set<AnyCancellable>()

    init(service: ArticleListViewServiceProtocol) {
        self.service = service
    }
}

extension ArticleListViewModel {
    
    func perform(action: ArticleListViewActions) {
        
        switch action {
            
        case .didAppear:
            service.fetchArticles()
                .sink { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                    self.showLoader = false

                } receiveValue: { [weak self] articleResponse in
                    self?.articleList = articleResponse.results
                }
                .store(in: &cancellables)
        }
    }
}
