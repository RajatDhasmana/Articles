//
//  ArticleListViewMocks.swift
//  ArticlesTests
//
//  Created by Rajat Dhasmana on 23/10/24.
//

import Foundation
@testable import Articles
import Combine

extension ArticleListViewService {
    
    static let mockSuccess: Self = {
        ArticleListViewService(
            fetchArticles: {
                return Just(.mock)
                    .setFailureType(to: ServiceError.self)
                    .eraseToAnyPublisher()
            })
    }()
    
    static let mockFailure: Self = {
        ArticleListViewService(
            fetchArticles: {
                return Fail(error: ServiceError.noResponse)
                    .eraseToAnyPublisher()
            })
    }()
    
    static let mockEmptyResponse: Self = {
        ArticleListViewService(
            fetchArticles: {
                return Just(.mockEmpty)
                    .setFailureType(to: ServiceError.self)
                    .eraseToAnyPublisher()
            })
    }()

}

extension Article {
    static let mock: Self = {
       return Article(url: "www.google.com", id: 1, publishedDate: "2024-10-16", byline: "by rajat", title: "rajat title", abstract: "Description", media: [])
    }()
}

extension ArticleListResponse {
    static let mock: Self = {
        return ArticleListResponse(status: "OK", copyright: "Copyright", numResults: 1, results: [.mock])
    }()
    
    static let mockEmpty: Self = {
        return ArticleListResponse(status: "OK", copyright: "Copyright", numResults: 0, results: [])
    }()

}
