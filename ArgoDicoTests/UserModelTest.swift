//
//  UserModelTest.swift
//  ArgoDicoTests
//
//  Created by Otourou Da Costa on 19/07/2020.
//  Copyright © 2020 Otourou Da Costa. All rights reserved.
//

import XCTest
@testable import ArgoDico

class UserModelTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFormModelHasRequiredFields() throws {
        
        let uid = UUID().uuidString
        let email = "test@test.fr"
        let displayName = "Test"

        let dicoEntryModel = User(uid: uid, displayName: displayName, email: email)
        
        XCTAssertNotNil(dicoEntryModel)
    }

}
