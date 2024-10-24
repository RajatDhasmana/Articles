//
//  EmptyStateViewModel.swift
//  Articles
//
//  Created by Rajat Dhasmana on 25/10/24.
//

import Foundation

struct EmptyStateViewModel {
    let emptyStateText: String = Constant.emptyDataViewText.rawValue
    var retryClosure: (() -> Void)?
}
