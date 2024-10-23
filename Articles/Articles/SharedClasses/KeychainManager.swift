//
//  KeychainManager.swift
//  Articles
//
//  Created by Rajat Dhasmana on 23/10/24.
//

import Foundation
import Security

class KeychainManager {
    static let shared = KeychainManager()

    private init() {}
    
    private let keychainQueue = DispatchQueue(label: "com.articles.KeychainManagerQueue", attributes: .concurrent)
}

extension KeychainManager {
    
    // Function to save data to keychain
    @discardableResult
    func save(key: String, data: Data) -> OSStatus {
        return keychainQueue.sync(flags: .barrier) {
            let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: key,
                kSecValueData as String: data
            ]
            
            SecItemDelete(query as CFDictionary)
            return SecItemAdd(query as CFDictionary, nil)
        }
    }

    // Function to retrieve data from keychain
    @discardableResult
    func load(key: String) -> Data? {
        return keychainQueue.sync {
            let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: key,
                kSecReturnData as String: true,
                kSecMatchLimit as String: kSecMatchLimitOne
            ]
            
            var result: AnyObject?
            let status = SecItemCopyMatching(query as CFDictionary, &result)
            if status == errSecSuccess {
                return result as? Data
            }
            return nil
        }
    }
    
    // Function to delete data from keychain
    @discardableResult
    func delete(key: String) -> OSStatus {
        return keychainQueue.sync(flags: .barrier) {
            let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: key
            ]
            return SecItemDelete(query as CFDictionary)
        }
    }
}
