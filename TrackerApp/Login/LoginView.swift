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
            backgroundGray.ignoresSafeArea()
            VStack {
                VStack {
                    SpacingView(height: 30)
                    HStack {
                        Image("app-img")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .cornerRadius(10)
                            .shadow(color: .black.opacity(0.05), radius: 5, x: 2, y: 4)
                        Spacer()
                    }
                    SpacingView(height: 20)
                    
                    HStack {
                        TextView(text: "Scatter for JHHS", size: 32, fontWeight: .bold, color: .black)
                        Spacer()
                    }
                    SpacingView(height: 30)
                }
                VStack {
                    
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
                    
//                    ErrorsView(errors: $loginViewModel.errors)
                    Button {
                        loginViewModel.signinTheUser { completed in
                            if completed {
                                withAnimation {
                                    userSession.isSignedIn = completed
                                }
                            }
                        }
                    } label: {
                        ButtonView(text: "Sign in")
                    }
                }
                
                Spacer()
            }
            .padding(30)
        }.onTapGesture {
            self.hideKeyboard()
        }.alert(item: $loginViewModel.error) { errorName in
            Alert(
                title: Text("Invalid credentials"),
                message: Text(errorName.text),
                dismissButton: .default(Text("Okay"))
            )
        }
    }
        
}
