//
//  ArticleListResponse.swift
//  Articles
//
//  Created by Rajat Dhasmana on 23/10/24.
//

import Foundation

struct ArticleListResponse: Codable {
    let status, copyright: String
    let numResults: Int
    let results: [Article]

    enum CodingKeys: String, CodingKey {
        case status, copyright
        case numResults = "num_results"
        case results
    }
}

struct Article: Codable {
    let url: String
    let id: Int
    let publishedDate: String
    let byline: String
    let title: String

    enum CodingKeys: String, CodingKey {
        case url, id
        case publishedDate = "published_date"
        case byline, title
    }
}
