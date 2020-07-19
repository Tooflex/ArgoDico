//
//  SignUpView.swift
//  ArgoDico
//
//  Created by Otourou Da Costa on 10/07/2020.
//  Copyright © 2020 Otourou Da Costa. All rights reserved.
//

import SwiftUI
import Firebase


struct SignUpView: View {
    
    @EnvironmentObject var session: SessionStore
    @Environment(\.presentationMode) var presentationMode
    
    
    @State private var emailAddress = ""
    @State private var newPassword = ""
    @State private var confirmedPassword = ""
    @State private var errorMessage = ""
    
    @State private var loading = false
    @State private var error = false
    @State private var isSignUp = false
    @State private var isError = false
    
    
    private func isEmailValid() -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: emailAddress)
    }
    
    private func isPasswordValid() -> Bool {
        if !newPassword.isEmpty && newPassword == confirmedPassword {
            return true
        }
        
        return false
    }
    
    fileprivate func handleAuthErrors(_ error: Error?) {
        if let errCode = AuthErrorCode(rawValue: error!._code) {
            
            switch errCode {
            case .invalidEmail:
                self.errorMessage = "Email is invalid"
            case .emailAlreadyInUse:
                self.errorMessage = "Email already in use"
            case .missingEmail:
                self.errorMessage = "Email is missing"
            case .weakPassword:
                self.errorMessage = "Password should be at least 6 characters"
            default:
                self.errorMessage = "\(error.debugDescription)"
            }
            self.isError = true
        }
    }
    
    func signUp() {
        loading = true
        error = false
        session.signUp(email: emailAddress, password: newPassword) { (authDataResult, error) in
            self.loading = false
            guard let user = authDataResult?.user, error == nil else {
                
                self.handleAuthErrors(error)
                
                return
            }
            print("\(user.email!) created")
            
            self.isSignUp = true
        }
        
    }
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                TextField("Email Address",
                          text: $emailAddress)
                SecureField("New Password", text: $newPassword)
                SecureField("Confirm New Password", text: $confirmedPassword)
                
                if self.isEmailValid() && self.isPasswordValid() {
                    Button(action: {
                        self.signUp()
                    }, label: {
                        Text("Sign Up")
                    })
                }
                
            }.alert(isPresented: $isSignUp, content: {
                Alert(title: Text("User created"),
                      message: Text("You can now Log In"),
                      dismissButton: .default(Text("OK")) { self.presentationMode.wrappedValue.dismiss()
                    })
            }).alert(isPresented: $isError) {
                Alert(title: Text("Error while Sign Up"), message: Text("\(errorMessage)"), dismissButton: .default(Text("OK")))
            }
                .navigationBarTitle(Text("Sign Up"))
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}


#if DEBUG
struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SignUpView()
                .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
            SignUpView()
                .environment(\.colorScheme, .dark)
            NavigationView {
                SignUpView()
            }
        }
    }
}
#endif
