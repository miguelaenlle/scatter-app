//
//  BackButton.swift
//  Teacherd
//
//  Created by Pink Flamingo on 1/19/22.
//

import SwiftUI

struct BackButton: View {
    var body: some View {
        HStack {
            Image(systemName: "chevron.left")
                .foregroundColor(darkGray)
                .font(Font.system(size: 20))
                .padding(.trailing, 0)
            TextView(text: "Back", size: 20, fontWeight: .medium, color: darkGray)

        }
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton()
    }
}
