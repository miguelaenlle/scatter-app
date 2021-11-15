//
//  HeaderView.swift
//  ScheduleApp
//
//  Created by Miguel Aenlle on 5/27/21.
//

import SwiftUI

struct HeaderView: View {
    var text: String
    
    var body: some View {
        
        
        HStack {
            TextView(text: text, size: FontSizes().large, fontWeight: .bold)
            
            Spacer()
        }
        SpacingView(height: 20)
    }
}

