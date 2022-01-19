//
//  EmailTeacher.swift
//  TrackerApp
//
//  Created by Pink Flamingo on 11/14/21.
//

import SwiftUI

struct EmailTeacher: View {
    var email: String
    var emphasized: Bool = false
    var body: some View {
    
        Button {
            if (email != "") {
                if let url = URL(string: "mailto:\(email)") {
                    UIApplication.shared.open(url)
                }
            }
        } label: {
            Image(systemName: "envelope.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(emphasized ? .white : .gray)
                .background(Color.clear)
                .frame(width: 30, height: 30)
            
        }
    }
}
