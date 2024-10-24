//
//  DownloadedImageViewModelTests.swift
//  ArticlesTests
//
//  Created by Rajat Dhasmana on 23/10/24.
//

import XCTest
@testable import Articles

final class DownloadedImageViewModelTests: XCTestCase {

    var viewModel: DownloadedImageViewModel!
    var serviceMock: DownloadedImageServiceProtocol!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        viewModel = nil
        serviceMock = nil
    }

    func testImageDownloadSuccessfully() throws {
        serviceMock = ImageDownloadServiceMockSuccess()
        viewModel = DownloadedImageViewModel(urlStr: "google.com", imageDownloadService: serviceMock)
        XCTAssertEqual(viewModel.viewState, .loading)
        viewModel.perform(action: .didAppear)
        XCTAssertEqual(viewModel.viewState, .success(UIImage()))
    }
    
    func testImageDownloadFails() throws {
        serviceMock = ImageDownloadServiceMockFailure()
        viewModel = DownloadedImageViewModel(urlStr: "google.com", imageDownloadService: serviceMock)
        XCTAssertEqual(viewModel.viewState, .loading)
        viewModel.perform(action: .didAppear)
        XCTAssertEqual(viewModel.viewState, .failure)
    }
    
    func testLoaderVisibilityOnStart() {
        serviceMock = ImageDownloadServiceMockSuccess()
        viewModel = DownloadedImageViewModel(urlStr: "google.com", imageDownloadService: serviceMock)
        XCTAssertEqual(viewModel.viewState, .loading)
    }
}
