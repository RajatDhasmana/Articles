//
//  DownloadedImageService.swift
//  Articles
//
//  Created by Rajat Dhasmana on 23/10/24.
//

import Foundation
import Combine
import UIKit

protocol DownloadedImageServiceProtocol {
    func downloadImage(url: URL) -> AnyPublisher<UIImage, ImageDownloadError>
}

struct DownloadedImageService: DownloadedImageServiceProtocol {
    func downloadImage(url: URL) -> AnyPublisher<UIImage, ImageDownloadError> {
        let urlRequest = URLRequest(url: url)
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { data, _ in
                guard let image = UIImage(data: data) else {
                    throw ImageDownloadError.downloadError
                }
                return image
            }
            .mapError({ error in
                ImageDownloadError.downloadError
            })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

enum ImageDownloadError: Error {
    case downloadError
    case notAbleToConvertDataToImage
    
    var errorDescription: String? {
        switch self {
        case .downloadError:
            return "Download Error"
        case .notAbleToConvertDataToImage:
            return "Error while converting data to image"
        }
    }
}
