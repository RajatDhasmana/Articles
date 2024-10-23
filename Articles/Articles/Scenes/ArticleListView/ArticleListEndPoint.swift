//
//  ArticleListEndPoint.swift
//  Articles
//
//  Created by Rajat Dhasmana on 23/10/24.
//

import Foundation

internal enum ArticleListEndPoint: Endpoint {
    var path: String {
        switch self {
        case .getArticleList:
            return "mostpopular/v2/mostviewed/all-sections/7.json?api-key=\(apiKey ?? "")"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .getArticleList:
                .get
        }
    }
    
    case getArticleList
}
