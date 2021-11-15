//
//  ButtonView.swift
//  ScheduleApp
//
//  Created by Miguel Aenlle on 5/27/21.
//

import SwiftUI

struct ButtonView: View {
    var text: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(darkOrange)
            HStack {
                Spacer()
                TextView(text: text, size: FontSizes().medium, fontWeight: .bold, color: .white)
                Spacer()
            }
        }
        .frame(height: 60)
        .shadow(color: darkOrange.opacity(0.1), radius: 20, x: 0, y: 10)
    }
}
