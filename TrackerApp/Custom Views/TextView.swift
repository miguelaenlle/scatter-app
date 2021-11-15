//
//  TextView.swift
//  ScheduleApp
//
//  Created by Miguel Aenlle on 5/27/21.
//

import SwiftUI

struct TextView: View {
    
    var text: String
    var size: CGFloat = FontSizes().medium
    var fontWeight: Font.Weight = .regular
    var color: Color = .black
    var body: some View {
        Text(text)
            .font(Font.custom(customFont, size: size))
            .fontWeight(fontWeight)
            .foregroundColor(color)
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView(text: "Placeholder")
    }
}
