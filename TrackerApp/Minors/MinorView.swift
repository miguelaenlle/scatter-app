//
//  MinorView.swift
//  TrackerApp
//
//  Created by Pink Flamingo on 11/14/21.
//

import SwiftUI

struct MinorView: View {
    var minor: Minor
    func convertDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        return dateFormatter.string(from: date)
    }
    var body: some View {
        HStack {
            
            VStack(alignment: .leading) {
                TextView(text: minor.title, fontWeight: .bold)
                TextView(text: minor.description)
                TextView(text: minor.time)
                
            }
            .padding(15)
            Spacer()
            
        }
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: black.opacity(0.1), radius: 20, x: 0, y: 10)
    }
}
