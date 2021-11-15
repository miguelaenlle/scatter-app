//
//  TextFieldWithTitleView.swift
//  ScheduleApp
//
//  Created by Miguel Aenlle on 5/27/21.
//

import SwiftUI

struct TextFieldWithTitleView: View {
    @Binding var text: String
    var titleText: String
    var placeholderText: String
    var keyboardType: KeyboardTypes
    
    
    var body: some View {
        VStack {
            HStack {
                TextView(text: titleText, size: FontSizes().medium, fontWeight: .bold)
                Spacer()
            }
            
            SpacingView(height: 15)
            
            TextFieldView(text: $text, placeholderText: placeholderText, keyboardType: keyboardType)
        }
        
    }
}
