//
//  ErrorStateViewModel.swift
//  Articles
//
//  Created by Rajat Dhasmana on 25/10/24.
//

import Foundation

struct ErrorStateViewModel: Equatable {
    static func == (lhs: ErrorStateViewModel, rhs: ErrorStateViewModel) -> Bool {
        lhs.error == rhs.error
    }
    
    let error: ServiceError
    var retryClosure: (() -> Void)? = nil
}
