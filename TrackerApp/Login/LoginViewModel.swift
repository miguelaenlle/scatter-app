//
//  LoginViewModel.swift
//  TrackerApp
//
//  Created by Miguel Aenlle on 11/11/21.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct Message: Identifiable {
    let id = UUID()
    let text: String
}

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var loading: Bool = false
    @Published var displayErrorSheet: Bool = false
    
    @Published var error: Message? = nil
    
    func addError(_ error: String) {
        DispatchQueue.main.async {
            withAnimation {
                self.error = Message(text: error)
                
            }
        }
    }
    func resetErrors() {
        DispatchQueue.main.async {
            withAnimation {
                self.error = nil
                
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
