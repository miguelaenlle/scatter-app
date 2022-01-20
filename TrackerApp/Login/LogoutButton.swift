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
                withAnimation {
                    userSession.isSignedIn = false
                }
            }
        } label: {
            TextView(text: "Sign out", size: 20, fontWeight: .bold, color: .white)
                .background(Color.clear)
        }

    }
}

struct LogoutButton_Previews: PreviewProvider {
    static var previews: some View {
        LogoutButton()
    }
}
