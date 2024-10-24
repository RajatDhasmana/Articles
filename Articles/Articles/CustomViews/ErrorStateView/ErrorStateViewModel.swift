//
//  ErrorStateViewModel.swift
//  Articles
//
//  Created by Rajat Dhasmana on 25/10/24.
//

import Foundation

struct ErrorStateViewModel {
    let error: ServiceError
    var retryClosure: (() -> Void)?
}
