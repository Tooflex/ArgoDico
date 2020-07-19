//
//  DicoEntryModelTest.swift
//  ArgoDicoTests
//
//  Created by Otourou Da Costa on 19/07/2020.
//  Copyright © 2020 Otourou Da Costa. All rights reserved.
//

import XCTest
import FirebaseFirestore
@testable import ArgoDico

class DicoEntryModelTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFormModelHasRequiredFields() throws {
                
        let id = UUID().uuidString
        let word = "Swagg"
        let wordDefinitions = ["Salut ou provocation appartenant au vocabulaire des jeunes. \"Wesh\" est dérivé de l'arabe \"wesh rak\" (comment vas-tu ?)."]
        let illustrationImage = URL(fileURLWithPath: "https://cdn.radiofrance.fr/s3/cruiser-production/2018/02/dd1a0515-1d56-4b82-8a69-c2420fc2eb62/1200x680_wesh.jpg")
        let createdBy = "Tooflex"
        let createdOn = Timestamp.init()
        
        let dicoEntryModel = DicoEntry(id: id, word: word, wordDefinitions: wordDefinitions, illustrationImage: illustrationImage, createdBy: createdBy, createdOn: createdOn)
        
        XCTAssertNotNil(dicoEntryModel)
        
    }

}
