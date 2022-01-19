//
//  StudentDetailHeader.swift
//  Teacherd
//
//  Created by Pink Flamingo on 1/19/22.
//

import SwiftUI

struct StudentDetailHeader: View {
    var studentName: String
    var studentEmail: String
    var backClicked: (() -> Void)?
    func sendEmail() {
        if (studentEmail != "") {
            if let url = URL(string: "mailto:\(studentEmail)") {
                UIApplication.shared.open(url)
            }
        }
    }
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button {
                        backClicked?()
                    } label: {
                        BackButton()
                    }
                    Spacer()
                }
                SpacingView(height: 20)
                

                HStack {
                    TextView(text: studentName, size: 24, fontWeight: .bold, color: .black)
                    Spacer()
                }
                HStack {
                    Button {
                        sendEmail()
                    } label: {
                    
                        TextView(text: studentEmail, size: 16, fontWeight: .medium, color: .blue)
                    }
                    Spacer()
                }

            }
            .padding(15)
        }
        .padding(.top, 10)
    }
}
