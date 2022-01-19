//
//  UserView.swift
//  TrackerApp
//
//  Created by Miguel Aenlle on 11/14/21.
//

import SwiftUI

struct UserView: View {
    @EnvironmentObject var userSession: UserSession
    @State var displayLogout = false
    var body: some View {
        
        VStack(alignment: .leading, spacing: 30) {
            HStack {
                Button {
                    withAnimation {
                        displayLogout = !displayLogout
                    }
                } label: {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.white.opacity(0.5))
                        .background(Color.clear)
                        .frame(width: 50, height: 50)
                }
            }
            if (displayLogout) {
                VStack(alignment: .leading) {
                    PasswordChange()
                        .environmentObject(userSession)
                    LogoutButton()
                        .environmentObject(userSession)
                }
                .transition(.move(edge: displayLogout ? .leading : .trailing))
            }
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
