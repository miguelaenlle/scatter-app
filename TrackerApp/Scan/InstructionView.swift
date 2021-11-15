//
//  InstructionView.swift
//  TrackerApp
//
//  Created by Miguel Aenlle on 11/14/21.
//

import SwiftUI

struct InstructionView: View {
    var body: some View {
        
        VStack(alignment: .leading) {
            VStack {
                TextView(text: "Scan a student's ID to begin.")
            }

            .padding(30)
        }
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: black.opacity(0.1), radius: 20, x: 0, y: 10)
    }
}

struct InstructionView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionView()
    }
}
