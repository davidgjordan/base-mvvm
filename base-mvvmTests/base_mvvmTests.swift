//
//  base_mvvmTests.swift
//  base-mvvmTests
//
//  Created by David Granado Jordan on 7/5/22.
//

import XCTest
@testable import base_mvvm

class base_mvvmTests: XCTestCase {
    
    var authFirebaseManager: AuthFirebaseManager!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        authFirebaseManager = AuthFirebaseManager()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        authFirebaseManager = nil
    }

    func testInvalidLogin() throws {
        let invalidEmail = "123"
        let invalidPassword = "123"
        
        let expectation = self.expectation(description: "InvalidLogin")
        var error: Error?
        
        authFirebaseManager.login(email: invalidEmail, password: invalidPassword) { result in
            switch result {
            case .success(_):
                print("Success")
            case .failure(let err):
                error = err
            }
            expectation.fulfill()
            
        }

        wait(for: [expectation], timeout: 10)
        
        XCTAssertNotNil(error)
    }
    
    
    func testValidLogin() throws {
        // MARK: - Make sure there is already a user created with this credentials
        let invalidEmail = "test1@test.com"
        let invalidPassword = "test123"
        
        let expectation = self.expectation(description: "ValidLogin")
        var error: Error?
        var user: User?
        
        authFirebaseManager.login(email: invalidEmail, password: invalidPassword) { result in
            switch result {
            case .success(let u):
                user = u
            case .failure(let err):
                error = err
            }
            expectation.fulfill()
            
        }

        wait(for: [expectation], timeout: 10)
        // Test Valid user
        XCTAssertNotNil(user)
        // Test No errors
        XCTAssertNil(error)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
