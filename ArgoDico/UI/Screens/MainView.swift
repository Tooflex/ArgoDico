//
//  MainView.swift
//  ArgoDico
//
//  Created by Otourou Da Costa on 09/07/2020.
//  Copyright © 2020 Otourou Da Costa. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var session: SessionStore
    
    @ObservedObject var dicoItemsVM = DicoEntryListViewModel()
    
    @State private var searchText = ""
    @State private var isSignedOut = false
    let dicoItems = testDataItems
    
    func getUser () {
        session.listen()
    }
    
    func signOut() {
        self.isSignedOut = session.signOut()
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 40) {
            
            if (session.session != nil) {
                NavigationLink(destination: LoginView(), isActive: $isSignedOut) { EmptyView() }
                Button(action: signOut) {
                    Text("Sign Out")
                }
                SearchBar(text: $searchText)
                    .padding(.top)
                
                List(dicoItemsVM.dicoEntryCellViewModels.filter({ searchText.isEmpty ? true : $0.dicoEntry.word.contains(searchText) })) { dicoItemsCellVM in
                    DicoItemCell(dicoItemsCellVM: dicoItemsCellVM)
                    
                }
            } else {
                LoginView()
            }
            
        }.onAppear(perform: getUser)
    }
}

#if DEBUG

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(SessionStore())
    }
}
#endif
