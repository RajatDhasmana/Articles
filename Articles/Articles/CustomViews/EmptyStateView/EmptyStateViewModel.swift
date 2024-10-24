//
//  EmptyStateViewModel.swift
//  Articles
//
//  Created by Rajat Dhasmana on 25/10/24.
//

import Foundation

struct EmptyStateViewModel: Equatable {
    let emptyStateText: String
    var retryClosure: (() -> Void)?
    
    static func == (lhs: EmptyStateViewModel, rhs: EmptyStateViewModel) -> Bool {
        return lhs.emptyStateText == rhs.emptyStateText
    }
}
