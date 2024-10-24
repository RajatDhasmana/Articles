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

    func testResponseSuccess() throws {
        viewModel = ArticleListViewModel(service: ArticleListViewService.mockSuccess)
        XCTAssertEqual(viewModel.viewState, .loading)
        viewModel.perform(action: .didAppear)
        XCTAssertEqual(viewModel.viewState, .dataReceived(ArticleListResponse.mock.results))
    }
    
    func testResponseFailure() throws {
        viewModel = ArticleListViewModel(service: ArticleListViewService.mockFailure)
        XCTAssertEqual(viewModel.viewState, .loading)
        viewModel.perform(action: .didAppear)
        XCTAssertEqual(viewModel.viewState, .failure(.init(error: .noResponse)))
    }
    
    func testEmptyResponse() throws {
        viewModel = ArticleListViewModel(service: ArticleListViewService.mockEmptyResponse)
        XCTAssertEqual(viewModel.viewState, .loading)
        viewModel.perform(action: .didAppear)
        XCTAssertEqual(viewModel.viewState, .emptyData(.init(emptyStateText: AppConstant.emptyDataViewText.rawValue)))
    }
}
