//
//  SummaryView.swift
//  TrackerApp
//
//  Created by Pink Flamingo on 11/14/21.
//

import SwiftUI

struct SummaryView: View {
    @ObservedObject var mainDetailViewModel: MainDetailViewModel
    var body: some View {
        if let currentClass = mainDetailViewModel.currentClass {
            VStack {
                VStack(alignment: .leading) {
                    SpacingView(height: 20)
                    
                    TextView(text: "Active Class", size: 22, fontWeight: .bold, color: .black)
                        .padding(.horizontal, 10)
                    ScheduleView(scheduleData: currentClass, emphasized: true)
                        .padding(.horizontal, 10)
                    
                    SpacingView(height: 30)
                }
                .padding(5)
                Spacer()
            
            }
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: black.opacity(0.1), radius: 20, x: 0, y: 4)
            .padding(20)
        } else {
            VStack {
                
            }
        }
    }
}
