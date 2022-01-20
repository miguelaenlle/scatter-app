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
        VStack(alignment: .leading) {
            
            VStack(alignment: .leading) {
                
                if let dayType = mainDetailViewModel.dayType {
                    TextView(text: "\(dayType) Day", size: 22, fontWeight: .medium, color: .black)
                    
                } else {
                    TextView(text: "No school today.", size: 22, fontWeight: .medium, color: .black)
                }
                
                if let periodNumber = mainDetailViewModel.periodNumber {
                    TextView(text: "Period \(periodNumber)", size: 20, fontWeight: .medium, color: .gray)
                } else {
                    TextView(text: "No active period", size: 20, fontWeight: .medium, color: .gray)
                }
            }
            
            
            
            SpacingView(height: 20)
            
            
            TextView(text: "Orange Day Schedule", size: 22,  fontWeight: .bold, color: .orange)
            Divider()
            
            VStack {
                if (mainDetailViewModel.orangeDaySchedule.count > 0) {
                    
                
                    ForEach(mainDetailViewModel.orangeDaySchedule.sorted(by: { $0.period < $1.period }), id: \.self) { schedule in
                        ScheduleView(scheduleData: schedule)
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
            VStack(alignment: .leading) {
                SpacingView(height: 20)
                TextView(text: "Brown Day Schedule", size: 22,  fontWeight: .bold, color: .brown)
                Divider()
            }
            VStack {
                
                if (mainDetailViewModel.brownDaySchedule.count > 0) {
                    
                
                    ForEach(mainDetailViewModel.brownDaySchedule.sorted(by: { $0.period < $1.period }), id: \.self) { schedule in
                        ScheduleView(scheduleData: schedule)
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
        .padding(.horizontal, 20)
    }
}
