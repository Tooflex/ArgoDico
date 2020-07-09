//
//  MainView.swift
//  ArgoDico
//
//  Created by Otourou Da Costa on 09/07/2020.
//  Copyright © 2020 Otourou Da Costa. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @State private var searchText = ""
    let dicoItems = testDataItems
    var body: some View {
        
        VStack(alignment: .center, spacing: 40) {
            
            SearchBar(text: $searchText)
                .padding(.top)
                     
            List(dicoItems.filter({ searchText.isEmpty ? true : $0.word.contains(searchText) })) { item in
                Text(item.word)

               }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
