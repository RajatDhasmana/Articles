//
//  AppDelegate.swift
//  Articles
//
//  Created by Rajat Dhasmana on 23/10/24.
//

import Foundation
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        
        saveApiKey()
        return true
    }
}

extension AppDelegate {
    
    func saveApiKey() {
        let key = "3Am28KAHzQOVryrvPBnndH2YCCUuPk0I"
        
        guard let keyData = key.data(using: .utf8) else {
            print("Not able to convert key string to data")
            return
        }
        // delete previous saved key if there is
        KeychainManager.shared.delete(key: key)
        KeychainManager.shared.save(key: AppConstant.apiKey.rawValue, data: keyData)
    }
}
