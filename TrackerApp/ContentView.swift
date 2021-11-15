//
//  ContentView.swift
//  TrackerApp
//
//  Created by Miguel Aenlle on 11/11/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userSession: UserSession 
    var body: some View {
        if (userSession.isSignedIn == true) {
            MainDetailView()
                .environmentObject(userSession)
                .preferredColorScheme(.light)
        } else {
            LoginView()
                .environmentObject(userSession)
                .preferredColorScheme(.light)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
