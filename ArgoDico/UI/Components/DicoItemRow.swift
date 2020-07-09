//
//  DicoItemRow.swift
//  ArgoDico
//
//  Created by Otourou Da Costa on 09/07/2020.
//  Copyright © 2020 Otourou Da Costa. All rights reserved.
//

import SwiftUI

struct DicoItemRow: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack(alignment: .center, spacing: 20) {
                Text("Mot")
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
            Text("Lorem Ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nomuny eirmod tempor")
                .padding(.horizontal)
            Image(systemName: "flag").resizable().frame(width: 30, height: 30, alignment: .leading).padding(.leading)
            HStack(spacing: 20){
                Text("Par Toto - 01 Jan 2020")
                Spacer()
            Image(systemName: "hand.thumbsup").resizable().frame(width: 30, height: 30, alignment: .trailing)
            Image(systemName: "hand.thumbsdown").resizable().frame(width: 30, height: 30, alignment: .trailing)
            }
            .padding(.horizontal)
        }
    }
}

struct DicoItemRow_Previews: PreviewProvider {
    static var previews: some View {
        DicoItemRow()
    }
}

