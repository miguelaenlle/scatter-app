//
//  SliderCell.swift
//  Teacherd
//
//  Created by Pink Flamingo on 1/19/22.
//

import SwiftUI

struct SliderCell: View {
    var text: String
    @Binding var selectedText: String
    var body: some View {
        ZStack {
            if (selectedText == text) {
                darkOrange.cornerRadius(5)
                    .shadow(color: black.opacity(0.1), radius: 20, x: 0, y: 10)
            } else {
                Color.clear
            }
            TextView(text: text, size: 20, fontWeight: .medium, color: (selectedText == text) ? .white : .black)
                .padding(10)
        }
    }
}
