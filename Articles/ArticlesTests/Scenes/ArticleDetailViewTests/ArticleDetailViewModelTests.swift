//
//  ArticleDetailViewModelTests.swift
//  ArticlesTests
//
//  Created by Rajat Dhasmana on 25/10/24.
//

import XCTest
@testable import Articles

class ArticleDetailViewModelTests: XCTestCase {
    
    func testArticleDetailViewModelInitialization() {
        let testArticle = Article.mock
        let viewModel = ArticleDetailViewModel(article: testArticle)
        
        // Then
        XCTAssertEqual(viewModel.article.title, "article title")
        XCTAssertEqual(viewModel.article.abstract, "Description")
        XCTAssertEqual(viewModel.viewConstants.navTitle, "NY Times Most Popular")
    }
}
