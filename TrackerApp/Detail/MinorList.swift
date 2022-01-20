//
//  MinorList.swift
//  Teacherd
//
//  Created by Pink Flamingo on 1/19/22.
//

import SwiftUI

struct MinorList: View {
    @ObservedObject var mainDetailViewModel: MainDetailViewModel
    @State var constrained: Bool = true
    var body: some View {
        
        VStack {
            SpacingView(height: 30)
            HStack {
                Spacer()
                TextView(text: "Minors", size: 20, fontWeight: .bold)
                Spacer()
            }
            
            SpacingView(height: 30)
            
            if mainDetailViewModel.minors.count > 0 {
                ScrollView(showsIndicators: true) {
                    
                    LazyVStack {
                        ForEach(mainDetailViewModel.minors.sorted { $0.time.localizedStandardCompare($1.time) == .orderedDescending }, id: \.self) { minor in
                            MinorView(minor: minor)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 5)
                        }
                        
                        
                    }
                    .padding(.vertical, 20)
                }
                .padding(.horizontal, 5)
                
                .frame(maxHeight: constrained ? 500 : .infinity)
            } else {
                HStack {
                    Spacer()
                    TextView(text: "No minors 👍", fontWeight: .regular)
                    Spacer()
                }
                
            }
            SpacingView(height: 30)
            HStack {
                Spacer()
                Button(action: {
                    constrained = !constrained
                }) {
                    TextView(text: constrained ? "Maximize" : "Minimize", fontWeight: .medium, color: .blue)
                }
             
                Spacer()
            }
            SpacingView(height: 20)
        }
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: black.opacity(0.1), radius: 20, x: 0, y: 10)
        .padding(20)
    }
}
