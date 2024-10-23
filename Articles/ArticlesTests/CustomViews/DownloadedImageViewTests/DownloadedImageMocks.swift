//
//  DownloadedImageMocks.swift
//  ArticlesTests
//
//  Created by Rajat Dhasmana on 23/10/24.
//

import Foundation
@testable import Articles
import Combine
import UIKit

struct ImageDownloadServiceMockSuccess: DownloadedImageServiceProtocol {
    func downloadImage(url: URL) -> AnyPublisher<UIImage, Articles.ImageDownloadError> {
        return Just(UIImage())
            .setFailureType(to: ImageDownloadError.self)
            .eraseToAnyPublisher()
    }
}

struct ImageDownloadServiceMockFailure: DownloadedImageServiceProtocol {
    func downloadImage(url: URL) -> AnyPublisher<UIImage, Articles.ImageDownloadError> {
        return Fail(error: ImageDownloadError.downloadError)
            .eraseToAnyPublisher()
    }
}
