//
//  DicoItemCell.swift
//  ArgoDico
//
//  Created by Otourou Da Costa on 09/07/2020.
//  Copyright © 2020 Otourou Da Costa. All rights reserved.
//

import SwiftUI

struct DicoItemCell: View {
    @ObservedObject var dicoItemsCellVM: DicoEntryCellViewModel
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            HStack(alignment: .center, spacing: 20) {
                Text(dicoItemsCellVM.dicoEntry.word )
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("PrimaryColor"))
                    .multilineTextAlignment(.leading)
                    .padding()
                Spacer()
                HStack(spacing: 20){
                Image(systemName: "heart").resizable().frame(width: 30, height: 30, alignment: .trailing)
                Image("share")
                }
            }
            .padding(.horizontal)
            Text(dicoItemsCellVM.dicoEntry.wordDefinitions[0] ?? "Lorem Ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nomuny eirmod tempor")
                .padding(.horizontal)
            Image(systemName: "flag").resizable().frame(width: 30, height: 30, alignment: .leading).padding(.leading)
            HStack(spacing: 20){
                Text("\(dicoItemsCellVM.dicoEntry.createdBy ) - \(dicoItemsCellVM.dicoEntry.createdBy ).")
                Spacer()
            Image(systemName: "hand.thumbsup").resizable().frame(width: 30, height: 30, alignment: .trailing)
            Image(systemName: "hand.thumbsdown").resizable().frame(width: 30, height: 30, alignment: .trailing)
            }
            .padding(.horizontal)
        }
    }
}
