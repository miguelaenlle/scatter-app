//
//  LogoutButton.swift
//  TrackerApp
//
//  Created by Miguel Aenlle on 11/14/21.
//

import SwiftUI

struct LogoutButton: View {
    @EnvironmentObject var userSession: UserSession
    
    var body: some View {
        Button {
            signOut {
                userSession.isSignedIn = false
            }
        } label: {
            TextView(text: "Sign out", size: 15, fontWeight: .bold, color: .white)
                .background(Color.clear)
        }

    }
}

struct LogoutButton_Previews: PreviewProvider {
    static var previews: some View {
        LogoutButton()
    }
}
