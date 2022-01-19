//
//  FullScheduleView.swift
//  Teacherd
//
//  Created by Pink Flamingo on 1/19/22.
//

import SwiftUI

struct FullScheduleView: View {
    @ObservedObject var mainDetailViewModel: MainDetailViewModel
    var body: some View {
        SpacingView(height: 20)
            
        if let dayType = mainDetailViewModel.dayType {
            TextView(text: "\(dayType) Day", fontWeight: .bold, color: dayType == "Orange" ? darkOrange : lightBrown)
            
        } else {
            TextView(text: "No school today.", fontWeight: .bold, color: .black)
        }
        
        if let periodNumber = mainDetailViewModel.periodNumber {
            TextView(text: "Period \(periodNumber)", fontWeight: .bold, color: .black)
        } else {
            TextView(text: "No active period", fontWeight: .bold, color: .black)
        }
        
        SpacingView(height: 20)
        
        
        TextView(text: "Orange Day Schedule", fontWeight: .bold, color: .orange)
        
    
        if (mainDetailViewModel.orangeDaySchedule.count > 0) {
            
        
            ForEach(mainDetailViewModel.orangeDaySchedule.sorted(by: { $0.period < $1.period }), id: \.self) { schedule in
                ScheduleView(scheduleData: schedule)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
            }
            
        } else {
            HStack {
                Spacer()
                TextView(text: "Student has no classes on brown days.")
                Spacer()
                
            }
        }
        
        TextView(text: "Brown Day Schedule", fontWeight: .bold, color: .brown)
        
        if (mainDetailViewModel.brownDaySchedule.count > 0) {
            
        
            ForEach(mainDetailViewModel.brownDaySchedule.sorted(by: { $0.period < $1.period }), id: \.self) { schedule in
                ScheduleView(scheduleData: schedule)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
            }
            
        } else {
            HStack {
                Spacer()
                TextView(text: "Student has no classes on brown days.")
                Spacer()
                
            }
        }
    }
}
