//
//  EmailTeacher.swift
//  TrackerApp
//
//  Created by Pink Flamingo on 11/14/21.
//

import SwiftUI

struct EmailTeacher: View {
    var email: String
    var body: some View {
    
        Button {
            if (email != "") {
                if let url = URL(string: "mailto:\(email)") {
                    UIApplication.shared.open(url)
                }
            }
        } label: {
            Image(systemName: "envelope.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(email != "" ? Color.black: Color.black.opacity(0.5))
                .background(Color.clear)
                .frame(width: 50, height: 50)
            
        }
    }
}
