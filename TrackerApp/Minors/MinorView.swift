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
                TextView(text: minor.title, size: 20, fontWeight: .bold)
                TextView(text: minor.description, size: 16, fontWeight: .medium)
                TextView(text: minor.time, size: 16, fontWeight: .medium)
                
            }
            .padding(15)
            Spacer()
            
        }
        .background(midGray)
        .cornerRadius(5)
    }
}
