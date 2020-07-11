//
//  DicoEntryRepository.swift
//  ArgoDico
//
//  Created by Otourou Da Costa on 10/07/2020.
//  Copyright © 2020 Otourou Da Costa. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class DicoEntryRepository: ObservableObject {
    let db = Firestore.firestore()
    
    @Published var dicoEntries = [DicoEntry]()
    
    init() {
        loadData()
    }
    
    func loadData() {
        db.collection("dicoEntries")
        .order(by: "createdOn")
            .addSnapshotListener { (querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                self.dicoEntries = querySnapshot.documents.compactMap { document in
                    try? document.data(as: DicoEntry.self)
                }
            }
        }
    }
    
    func addDicoEntry(_ dicoEntry: DicoEntry) {
        do {
            let _ = try db.collection("dicoEntries").addDocument(from: dicoEntry)
        } catch {
            //TODO: Display Pop-Up
        }
    }
}
