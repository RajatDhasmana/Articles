//
//  KeychainManagerTests.swift
//  ArticlesTests
//
//  Created by Rajat Dhasmana on 23/10/24.
//

import XCTest
@testable import Articles

final class KeychainManagerTests: XCTestCase {

    let testKey = "testKey"
    let testValue = "TestValue"

    override func setUpWithError() throws {
        _ = KeychainManager.shared.delete(key: testKey)
    }

    override func tearDownWithError() throws {
        _ = KeychainManager.shared.delete(key: testKey)
    }
    
    func testSaveDataToKeychain() throws {
        let dataToSave = testValue.data(using: .utf8)!
        let status = KeychainManager.shared.save(key: testKey, data: dataToSave)
        
        XCTAssertEqual(status, errSecSuccess, "Saving data to keychain should return errSecSuccess.")
    }
    
    func testLoadDataFromKeychain() throws {
        let dataToSave = testValue.data(using: .utf8)!
        _ = KeychainManager.shared.save(key: testKey, data: dataToSave)
        
        let loadedData = KeychainManager.shared.load(key: testKey)
        XCTAssertNotNil(loadedData, "Data loaded from keychain should not be nil.")
        
        let loadedString = String(data: loadedData!, encoding: .utf8)
        XCTAssertEqual(loadedString, testValue, "Loaded data should match the saved data.")
    }
    
    func testDeleteDataFromKeychain() throws {
        let dataToSave = testValue.data(using: .utf8)!
        _ = KeychainManager.shared.save(key: testKey, data: dataToSave)
        
        let deleteStatus = KeychainManager.shared.delete(key: testKey)
        XCTAssertEqual(deleteStatus, errSecSuccess, "Deleting data from keychain should return errSecSuccess.")
        
        let loadedDataAfterDelete = KeychainManager.shared.load(key: testKey)
        XCTAssertNil(loadedDataAfterDelete, "Data should not exist after deletion.")
    }

    func testLoadNonExistentDataFromKeychain() throws {
        let loadedData = KeychainManager.shared.load(key: testKey)
        XCTAssertNil(loadedData, "Loading data that doesn't exist in keychain should return nil.")
    }
}
