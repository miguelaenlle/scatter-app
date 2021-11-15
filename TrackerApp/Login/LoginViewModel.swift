//
//  LoginViewModel.swift
//  TrackerApp
//
//  Created by Miguel Aenlle on 11/11/21.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var loading: Bool = false
    
    @Published var errors: [String] = []
    
    func addError(_ error: String) {
        DispatchQueue.main.async {
            withAnimation {
                self.errors.append(error)
                
            }
        }
    }
    func resetErrors() {
        DispatchQueue.main.async {
            withAnimation {
                self.errors = []
                
            }
        }
        
    }
    func signinTheUser(completion: @escaping(Bool) -> Void) {
        self.resetErrors()
        self.loading = true
        logUserIntoFirebase(email: email,
                            password: password) { error in
            if let error = error {
                self.addError(error)
                completion(false)
            } else {
                self.loading = false
                completion(true)
                
            }
            
        }
        
    }
    
    
}
