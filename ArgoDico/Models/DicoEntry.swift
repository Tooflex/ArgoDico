//
//  DicoEntry.swift
//  ArgoDico
//
//  Created by Otourou Da Costa on 09/07/2020.
//  Copyright © 2020 Otourou Da Costa. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct DicoEntry: Codable, Equatable, Identifiable {
    @DocumentID var id = UUID().uuidString
    let word: String
    let wordDefinitions: [String?]
    let illustrationImage: URL?
    let createdBy: String
    @ServerTimestamp var createdOn: Timestamp?
    
    typealias Code = String
}

#if DEBUG
let testDataItems = [
    DicoEntry(id: "1", word: "Wesh", wordDefinitions: ["Salut ou provocation appartenant au vocabulaire des jeunes. \"Wesh\" est dérivé de l'arabe \"wesh rak\" (comment vas-tu ?)."], illustrationImage: URL(fileURLWithPath: "https://cdn.radiofrance.fr/s3/cruiser-production/2018/02/dd1a0515-1d56-4b82-8a69-c2420fc2eb62/1200x680_wesh.jpg"), createdBy: "Tooflex", createdOn: Timestamp.init()),
    DicoEntry(id: "2", word: "Wesh 1", wordDefinitions: ["Salut ou provocation appartenant au vocabulaire des jeunes. \"Wesh\" est dérivé de l'arabe \"wesh rak\" (comment vas-tu ?)."], illustrationImage: URL(fileURLWithPath: "https://cdn.radiofrance.fr/s3/cruiser-production/2018/02/dd1a0515-1d56-4b82-8a69-c2420fc2eb62/1200x680_wesh.jpg"), createdBy: "Tooflex", createdOn: Timestamp.init()),
    DicoEntry(id: "3", word: "Wesh 2", wordDefinitions: ["Salut ou provocation appartenant au vocabulaire des jeunes. \"Wesh\" est dérivé de l'arabe \"wesh rak\" (comment vas-tu ?)."], illustrationImage: URL(fileURLWithPath: "https://cdn.radiofrance.fr/s3/cruiser-production/2018/02/dd1a0515-1d56-4b82-8a69-c2420fc2eb62/1200x680_wesh.jpg"), createdBy: "Tooflex", createdOn: Timestamp.init()),
    DicoEntry(id: "4", word: "Wesh 3", wordDefinitions: ["Salut ou provocation appartenant au vocabulaire des jeunes. \"Wesh\" est dérivé de l'arabe \"wesh rak\" (comment vas-tu ?)."], illustrationImage: URL(fileURLWithPath: "https://cdn.radiofrance.fr/s3/cruiser-production/2018/02/dd1a0515-1d56-4b82-8a69-c2420fc2eb62/1200x680_wesh.jpg"), createdBy: "Tooflex", createdOn: Timestamp.init())
]

#endif
