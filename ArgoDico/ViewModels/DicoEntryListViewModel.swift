//
//  DicoEntryListViewModel.swift
//  ArgoDico
//
//  Created by Otourou Da Costa on 10/07/2020.
//  Copyright © 2020 Otourou Da Costa. All rights reserved.
//

import Foundation
import Combine

class DicoEntryListViewModel: ObservableObject {
    @Published var dicoEntryRepository = DicoEntryRepository()
    @Published var dicoEntryCellViewModels = [DicoEntryCellViewModel]()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        dicoEntryRepository.$dicoEntries.map { dicoEntries in
            dicoEntries.map { dicoEntry in
                DicoEntryCellViewModel(dicoEntry: dicoEntry)
            }
        }.assign(to: \.dicoEntryCellViewModels , on: self)
        .store(in: &cancellables)
    }
    
    /**
    Creates a personalized greeting for a recipient.

    - Parameter recipient: The person being greeted.

    - Throws: `MyError.invalidRecipient`
              if `recipient` is "Derek"
              (he knows what he did).
    */
    func addDicoEntry(dicoEntry: DicoEntry) {
        dicoEntryRepository.addDicoEntry(dicoEntry)
    }
}
