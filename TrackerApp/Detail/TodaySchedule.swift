//
//  TodaySchedule.swift
//  Teacherd
//
//  Created by Pink Flamingo on 1/19/22.
//

import SwiftUI

struct TodaySchedule: View {
    @ObservedObject var mainDetailViewModel: MainDetailViewModel
    var body: some View {
        if (mainDetailViewModel.schedule.count > 0) {
            
        
            ForEach(mainDetailViewModel.schedule.sorted(by: { $0.period < $1.period }), id: \.self) { schedule in
                ScheduleView(scheduleData: schedule)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
            }
            
        } else {
            HStack {
                Spacer()
                TextView(text: "Student has no classes today.")
                Spacer()
                
            }
        }
    }
}
