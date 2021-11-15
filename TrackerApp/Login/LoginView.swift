//
//  LoginView.swift
//  TrackerApp
//
//  Created by Miguel Aenlle on 11/11/21.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var userSession: UserSession
    @ObservedObject var loginViewModel: LoginViewModel = LoginViewModel()
    
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            VStack {
                Spacer()
                VStack(alignment: .leading) {
                    VStack {
                        HeaderView(text: "TrackerApp")
                        
                        TextFieldWithTitleView(text: $loginViewModel.email,
                                               titleText: "Email",
                                               placeholderText: "Enter your email...",
                                               keyboardType: .email)
                        SpacingView(height: 30)
                        
                        TextFieldWithTitleView(text: $loginViewModel.password,
                                               titleText: "Password",
                                               placeholderText: "Enter your password...",
                                               keyboardType: .password)
                        SpacingView(height: 30)
                        ErrorsView(errors: $loginViewModel.errors)
                        Button(action: {
                            loginViewModel.signinTheUser { completed in
                                if completed {
                                    userSession.isSignedIn = completed
                                }
                            }
                        }) {
                            ButtonView(text: "Sign in")
                        }
                    }

                    .padding(30)
                }
                .background(Color.white)
                .cornerRadius(20)
                .padding(15)
                .shadow(color: black.opacity(0.1), radius: 20, x: 0, y: 10)
                Spacer()
            }
        }.onTapGesture {
            self.hideKeyboard()
        }
    }
        
}
