//
//  ButtonView.swift
//  ScheduleApp
//
//  Created by Miguel Aenlle on 5/27/21.
//

import SwiftUI

struct ButtonView: View {
    var text: String
    var invertedColorscheme: Bool = false
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(invertedColorscheme ? .white : darkOrange)
            ZStack {
                HStack {
                    Spacer()
                    TextView(text: text, size: FontSizes().medium, fontWeight: .bold, color: invertedColorscheme ? darkOrange: .white)
                    Spacer()
                }
                HStack {
                    Spacer()
                    Image(systemName: "chevron.right").foregroundColor(invertedColorscheme ? darkOrange: .white).font(Font.system(size: 15, weight: .bold))
                }
                .padding(.horizontal, 30)
            }
        }
        .frame(height: 60)
    }
}
