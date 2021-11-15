//
//  ErrorsView.swift
//  TrackerApp
//
//  Created by Miguel Aenlle on 11/14/21.
//

import SwiftUI

struct ErrorsView: View {
    @Binding var errors: [String]
    var body: some View {
        if errors.count > 0 {
            ForEach(errors, id: \.self) { error in
                TextView(text: error,
                         fontWeight: .regular,
                         color: .red)
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
