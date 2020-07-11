//
//  DicoEntryViewModel.swift
//  ArgoDico
//
//  Created by Otourou Da Costa on 10/07/2020.
//  Copyright © 2020 Otourou Da Costa. All rights reserved.
//

import Foundation

class DicoEntryCellViewModel: ObservableObject, Identifiable {
    @Published var dicoEntry: DicoEntry
    
    var id = ""
    
    init(dicoEntry: DicoEntry) {
        self.dicoEntry = dicoEntry
    }
}
