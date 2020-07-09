//
//  ContentView.swift
//  ArgoDico
//
//  Created by Otourou Da Costa on 09/07/2020.
//  Copyright © 2020 Otourou Da Costa. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
     @State private var emailAddress = ""
     @State private var password = ""
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 40) {
            // Logo
            Image("Logo-Argo-Dico")
            VStack(alignment: .center, spacing: 20) {
                // Login
                TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: $emailAddress)
                    .textFieldStyle(CustomTextFieldStyle())
                .padding(.horizontal, 40.0)
                // Password
                SecureField("Password", text: $password)
                .textFieldStyle(CustomTextFieldStyle())
                .padding(.horizontal, 40.0)
                // Sign In button
                Button(action: {}) {
                    
                    Text("Sign In")
                        .fontWeight(.bold)
                        .font(.callout)
                        .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [Color("PrimaryColor"), .white]), startPoint: .top, endPoint: .bottom))
                        .frame(width: nil)
                        .cornerRadius(26)
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity)
                     
                }.padding([.leading, .trailing], 20).frame(width: nil)

            }
            
            HStack(alignment: .center, spacing: 20) {
                Text("Don't have an account? ")
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Sign Up")
                        .fontWeight(.bold)
                }
            }
            Spacer()
            Text("Sign Up with social networks")
            HStack(alignment: .center, spacing: 20) {
                Image("facebook")
                Image("google-plus")
                Image("twitter")
            }
            Text("Created by Hip Hop Stories FR - 2020")
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

public struct CustomTextFieldStyle : TextFieldStyle {
    public func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .font(.largeTitle) // set the inner Text Field Font
            .padding(10) // Set the inner Text Field Padding
            //Give it some style
            .background(
                RoundedRectangle(cornerRadius: 26)
                    .strokeBorder(Color("PrimaryColor").opacity(0.5), lineWidth: 2))
    }
}
