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
    @State private var loading = false
    @State private var error = false
    @State private var errorSignUp = false
    @State private var isSignedIn = false
    
    @EnvironmentObject var session: SessionStore
    
    
    func signIn () {
        loading = true
        error = false
        session.signIn(email: emailAddress, password: password) { (result, error) in
            self.loading = false
            if error != nil {
                self.error = true
            } else {
                self.emailAddress = ""
                self.password = ""
                self.isSignedIn = true
            }
        }
    }
    
    
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .center, spacing: 40) {
                
                NavigationLink(destination: MainView(), isActive: $isSignedIn) { EmptyView() }
                
                // Logo
                Image("Logo-Argo-Dico")
                VStack(alignment: .center, spacing: 20) {
                    // Login
                    TextField("Login", text: $emailAddress)
                        .textFieldStyle(CustomTextFieldStyle())
                        .padding(.horizontal, 40.0)
                    // Password
                    SecureField("Password", text: $password)
                        .textFieldStyle(CustomTextFieldStyle())
                        .padding(.horizontal, 40.0)
                    if (error) {
                        Text("Error on Sign In")
                            .foregroundColor(Color.red)
                    }
                    // Sign In button
                    Button(action: {
                        self.signIn()
                    }) {
                        
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
                    NavigationLink(destination: SignUpView()) {
                        Text("Sign Up").fontWeight(.bold)
                    }.isDetailLink(false)
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
        }.navigationViewStyle(StackNavigationViewStyle())
        
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
#endif

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
