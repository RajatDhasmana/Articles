//
//  DownloadedImageViewModel.swift
//  Articles
//
//  Created by Rajat Dhasmana on 23/10/24.
//

import Foundation
import UIKit
import Combine

class DownloadedImageViewModel: ObservableObject {
    
    enum DowloadedImageActions {
        case didAppear
    }
    
    // MARK: - Published variables
    
    @Published var image: UIImage?
    @Published var showLoader: Bool = true

    // MARK: - Private variables
    
    private var cancellables = Set<AnyCancellable>()
    private var urlStr: String?
    private var imageDownloadService: DownloadedImageServiceProtocol
    
    init(image: UIImage? = nil,
         urlStr: String? = nil,
         imageDownloadService: DownloadedImageServiceProtocol) {
        self.image = image
        self.urlStr = urlStr
        self.imageDownloadService = imageDownloadService
    }
}

extension DownloadedImageViewModel {
    func perform(action: DowloadedImageActions) {
    
        switch action {
            
        case .didAppear:
            guard let urlStr, let url = URL(string: urlStr), image == nil else {return}
            imageDownloadService.downloadImage(url: url)
                .sink { [weak self] completion in
                    
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                    self?.showLoader = false
                } receiveValue: { [weak self] img in
                    self?.image = img
                    self?.showLoader = false
                }
                .store(in: &cancellables)
        }
    }
}
