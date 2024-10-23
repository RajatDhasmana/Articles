//
//  Endpoint.swift
//  Articles
//
//  Created by Rajat Dhasmana on 23/10/24.
//

import Foundation
import Network

public protocol Endpoint {
    var baseUrl: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var fullURLStr: String { get }
    var apiKey: String? { get }
}

extension Endpoint {
    var baseUrl: String {
        return "https://api.nytimes.com/svc/"
    }
    
    var fullURLStr: String {
        return "\(baseUrl)\(path)"
    }
    
    var apiKey: String? {
        guard let data = KeychainManager.shared.load(key: Constant.apiKey.rawValue) else {
            return nil
        }
        return String(data: data, encoding: .utf8)
    }
}

public enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case put = "PUT"
}
