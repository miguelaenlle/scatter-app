//
//  ScheduleView.swift
//  TrackerApp
//
//  Created by Miguel Aenlle on 11/14/21.
//

import SwiftUI

struct ScheduleView: View {
    var scheduleData: Schedule
    
    var body: some View {
        
        HStack {
            
            VStack(alignment: .leading) {
                TextView(text: scheduleData.className, fontWeight: .bold)
                TextView(text: "Period \(scheduleData.period)")
                
            }
            .padding(15)
            Spacer()
            VStack(alignment: .trailing) {
                Spacer()
                EmailTeacher(email: scheduleData.teacherEmail)
                Spacer()
            }
            .padding(15)
            
        }
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: black.opacity(0.1), radius: 20, x: 0, y: 10)
    }
}
