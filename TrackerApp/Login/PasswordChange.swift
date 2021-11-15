//
//  PasswordChange.swift
//  TrackerApp
//
//  Created by Miguel Aenlle on 11/14/21.
//

import SwiftUI

struct PasswordChange: View {
    
    @EnvironmentObject var userSession: UserSession
    @State var emailSent = false
    @State var loading = false
    
    func changePasswordFunc() {
        if let email = auth.currentUser?.email {
            loading = true
            changePassword(email: email) {
                withAnimation {
                    emailSent = true
                    loading = false
                }
                print()
            }
        }
    }
    var body: some View {
        
        Button {
            changePasswordFunc()
        } label: {
            TextView(text: "Change password", size: 15, fontWeight: .bold, color: .white)
                .background(Color.clear)
                .disabled(loading)
        }
        if (emailSent) {
            
            TextView(text: "A password change email was sent.", size: 15, fontWeight: .bold, color: .green)
                .background(Color.clear)
        }

    }
}

struct PasswordChange_Previews: PreviewProvider {
    static var previews: some View {
        PasswordChange()
    }
}
