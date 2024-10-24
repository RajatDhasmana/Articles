//
//  WebserviceHelper.swift
//  Articles
//
//  Created by Rajat Dhasmana on 23/10/24.
//

import Foundation
import Combine

public struct WebserviceHelper {
                
    static func request<T: Decodable>(endPoint: Endpoint) -> AnyPublisher<T, ServiceError> {
        
        guard let url = URL(string: endPoint.fullURLStr) else {
            return Fail(error: ServiceError.invalidUrl).eraseToAnyPublisher()
        }
        
        let urlRequest = URLRequest(url: url)

        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { (data, response) in
                
                guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
                    throw ServiceError.unAuthorised
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError({ error in
                ServiceError(error: error)
            })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

enum ServiceError: Error, Equatable {
    
    case notAbleToDecode
    case noResponse
    case invalidUrl
    case unAuthorised
    case unknown(errorStr: String)
    
    init(statusCode: Int, error: Error) {
        
        switch statusCode {
        case 204:
            self = .notAbleToDecode
        case 400:
            self = .invalidUrl
        case 401:
            self = .noResponse
        case 405:
            self = .unAuthorised
        default:
            self = .unknown(errorStr: error.localizedDescription)
        }
    }
    
    init(error: Error) {
        switch error {
            
        case is URLError:
            self = .invalidUrl
            
        default:
            self = .unknown(errorStr: error.localizedDescription)
        }
    }
    
    var errorDescription: String? {
        switch self {
        case .notAbleToDecode:
            return AppConstant.notAbleToDecodeError.rawValue
        case .noResponse:
            return AppConstant.noResponseError.rawValue
        case .invalidUrl:
            return AppConstant.invalidUrlError.rawValue
        case .unAuthorised:
            return AppConstant.unAuthorisedError.rawValue
        case .unknown(let errorStr):
            return errorStr
        }
    }
    
    var shownError: String { AppConstant.shownError.rawValue }
}

