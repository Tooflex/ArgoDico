//
//  DicoEntryViewModel.swift
//  ArgoDico
//
//  Created by Otourou Da Costa on 10/07/2020.
//  Copyright © 2020 Otourou Da Costa. All rights reserved.
//

import Foundation
import Combine

class DicoEntryCellViewModel: ObservableObject, Identifiable {
    @Published var dicoEntry: DicoEntry
    @Published var cancellables = Set<AnyCancellable>()
    
    var id = ""
    
    init(dicoEntry: DicoEntry) {
        self.dicoEntry = dicoEntry
        
        $dicoEntry.compactMap { dicoEntry in
            (dicoEntry.id)
        }.assign(to: \.id, on: self)
        .store(in: &cancellables)
    }
}
