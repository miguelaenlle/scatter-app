//
//  ErrorsView.swift
//  TrackerApp
//
//  Created by Miguel Aenlle on 11/14/21.
//

import SwiftUI

struct ErrorsView: View {
    @Binding var errors: [String]
    let alertColor = Color(#colorLiteral(red: 0.9764705882, green: 0.0862745098, blue: 0.003921568627, alpha: 1))
    var body: some View {
        if errors.count > 0 {
            ForEach(errors, id: \.self) { error in
                TextView(text: error,
                         fontWeight: .bold,
                         color: alertColor)
                    .frame(alignment: .leading)
            }
            SpacingView(height: 30)
        } else {
            SpacingView(height: 0.1)
        }
    }
}

struct ErrorsView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorsView(errors: .constant([]))
    }
}
