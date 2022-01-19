//
//  Slider.swift
//  Teacherd
//
//  Created by Pink Flamingo on 1/19/22.
//

import SwiftUI

struct Slider: View {
    @Binding var selectedElement: String
    var elements: [String]
    var body: some View {
        HStack {
            ForEach(elements, id: \.self) { element in
                SliderCell(text: element, selectedText: $selectedElement)
            }
        }
        .background(midGray)
        .cornerRadius(5)
        .frame(height: 40)
        .shadow(color: black.opacity(0.1), radius: 10, x: 0, y: 4)
    }
}
