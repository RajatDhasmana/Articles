//
//  ArticleDetailViewModel.swift
//  Articles
//
//  Created by Rajat Dhasmana on 23/10/24.
//

import Foundation

struct ArticleDetailViewModel {
    
    struct Constant {
        let navTitle = "NY Times Most Popular"
    }

    let article: Article
    var viewConstants = Constant()
}
