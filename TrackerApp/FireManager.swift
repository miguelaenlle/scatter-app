//
//  FireManager.swift
//  ScheduleApp
//
//  Created by Miguel Aenlle on 5/28/21.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

let auth = Auth.auth()

func formatTime(_ time: String) -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm"
    return dateFormatter.date(from: time)
}
func logUserIntoFirebase(email: String,
                         password: String,
                         completion: @escaping(String?) -> Void) {
    auth.signIn(withEmail: email,
                password: password) { result, error in
        if let error = error {
            completion(error.localizedDescription)
        } else {
            completion(nil)
        }
    }
}

func getUID() -> String? {
    if let uid = Auth.auth().currentUser?.uid {
        return uid
    } else {
        return nil
    }
}

func userIsSignedIn() -> Bool {
    return getUID() != nil
}

func signOut(completion: @escaping() -> Void) {
    do {
        try auth.signOut()
        completion()
    } catch {
        completion()
    }
}

func changePassword(email: String, completion: @escaping() -> Void) {

    try Auth.auth().sendPasswordReset(withEmail: email) { error in
        completion()
    }
}
