//
//  CurrentOptionSelectorView.swift
//  ScheduleApp
//
//  Created by Pink Flamingo on 5/27/21.
//

import SwiftUI


struct CurrentOptionSelectorViewCell: View {
    @Binding var selectedOption: String
    var optionText: String
    var body: some View {
        TextView(text: optionText,
                 size: FontSizes().medium,
                 fontWeight: .semibold)
            .padding(.horizontal, 20)
            .padding(.vertical, 15)
            .background(Color.white)
                            .cornerRadius(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(optionText == selectedOption ? darkGray : .clear, lineWidth: 1)
                            )
                            .shadow(color: black.opacity(0.1),
                                    radius: 20,
                                    x: 0,
                                    y: 4)
            .onTapGesture {
                withAnimation {
                    selectedOption = optionText
                }
            }
    }
}


struct CurrentOptionSelectorView: View {
    @Binding var selectedOption: String
    var options: [String]
    
    var body: some View {
        ForEach(options, id: \.self) { option in
            CurrentOptionSelectorViewCell(selectedOption: $selectedOption, optionText: option)
        }
        
    }
}


struct CurrentOptionSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentOptionSelectorView(selectedOption: .constant("Option 1"), options: ["Option 1", "Opt"])
    }
}
