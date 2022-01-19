//
//  MinorList.swift
//  Teacherd
//
//  Created by Pink Flamingo on 1/19/22.
//

import SwiftUI

struct MinorList: View {
    @ObservedObject var mainDetailViewModel: MainDetailViewModel
    var body: some View {
        
        VStack {
            SpacingView(height: 30)
            HStack {
                Spacer()
                TextView(text: "Minors", fontWeight: .bold)
                Spacer()
            }
            
            SpacingView(height: 30)
            if mainDetailViewModel.minors.count > 0 {

                LazyVStack {
                    ForEach(mainDetailViewModel.minors, id: \.self) { minor in
                        MinorView(minor: minor)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 5)
                    }
                    
                }
            } else {
                HStack {
                    Spacer()
                    TextView(text: "No minors 👍", fontWeight: .regular)
                    Spacer()
                }
                
            }
            SpacingView(height: 30)
        }
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: black.opacity(0.1), radius: 20, x: 0, y: 10)
        .padding(20)
    }
}
