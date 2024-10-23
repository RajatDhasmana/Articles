//
//  ArticleListViewService.swift
//  Articles
//
//  Created by Rajat Dhasmana on 23/10/24.
//

import Foundation
import Combine

internal protocol ArticleListViewServiceProtocol {
    var fetchArticles: () -> AnyPublisher<ArticleListResponse, ServiceError> { get }
}

internal struct ArticleListViewService: ArticleListViewServiceProtocol {
    let fetchArticles: () -> AnyPublisher<ArticleListResponse, ServiceError>
}

internal extension ArticleListViewService {
    static var live: Self = {
        ArticleListViewService(
            fetchArticles: {
                WebserviceHelper.request(endPoint: ArticleListEndPoint.getArticleList)
            })
    }()
}
