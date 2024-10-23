//
//  ArticleListViewModelTest.swift
//  ArticlesTests
//
//  Created by Rajat Dhasmana on 23/10/24.
//

import XCTest
@testable import Articles

final class ArticleListViewModelTest: XCTestCase {

    var viewModel: ArticleListViewModel!

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testSuccessResponseSuccess() throws {
        viewModel = ArticleListViewModel(service: ArticleListViewService.mockSuccess)
        XCTAssertTrue(viewModel.showLoader)
        viewModel.perform(action: .didAppear)
        XCTAssertFalse(viewModel.showLoader)
        XCTAssertEqual(viewModel.articleList.count, 1)
    }
    
    func testSuccessResponseFailure() throws {
        viewModel = ArticleListViewModel(service: ArticleListViewService.mockFailure)
        XCTAssertTrue(viewModel.showLoader)
        viewModel.perform(action: .didAppear)
        XCTAssertFalse(viewModel.showLoader)
        XCTAssertEqual(viewModel.articleList.count, 0)
    }
}
