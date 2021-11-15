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
        
        VStack {
            HStack {
                Spacer()
                VStack {
                    SpacingView(height: 30)
                    
                    if let currentClass = mainDetailViewModel.currentClass {
                        TextView(text: "Current Class", fontWeight: .bold)
                        ScheduleView(scheduleData: currentClass)
                            .padding(.horizontal, 20)
                    } else {
                        
                        TextView(text: "Student has no active class.", fontWeight: .bold)
                    }
                    
                    SpacingView(height: 30)
                }
                Spacer()
            }
        }
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: black.opacity(0.1), radius: 20, x: 0, y: 10)
        .padding(20)
    }
}
