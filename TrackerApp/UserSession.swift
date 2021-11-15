//
//  UserSession.swift
//  ScheduleApp
//
//  Created by Miguel Aenlle on 5/28/21.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

class UserSession: ObservableObject {
    @Published var isSignedIn: Bool = false
    
    init() {
        self.isSignedIn = userIsSignedIn()
    }
}
