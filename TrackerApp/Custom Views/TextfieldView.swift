//
//  TextFieldView.swift
//  ScheduleApp
//
//  Created by Miguel Aenlle on 5/27/21.
//

import SwiftUI

enum KeyboardTypes {
    case normal, numpad, email, password
}

struct TextFieldView: View {
    @Binding var text: String
    var placeholderText: String
    var keyboardType: KeyboardTypes
    var body: some View {
        HStack {
            Spacer()
            
            
            
            switch keyboardType {
                case .normal:
                    TextField(placeholderText, text: $text)
                        .font(.system(size: FontSizes().medium))
                case .numpad:
                    TextField(placeholderText, text: $text)
                        .keyboardType(.numberPad)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .font(.system(size: FontSizes().medium))
                        
                case .email:
                    TextField(placeholderText, text: $text)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .font(.system(size: FontSizes().medium))
                
                case .password:
                    SecureField(placeholderText, text: $text)
                        .keyboardType(.asciiCapable)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .font(.system(size: FontSizes().medium))
            }
            
            Spacer()
        }
        .frame(height: 52)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(gray, lineWidth: 1)
                .frame(height: 52)
        )
    }
}
