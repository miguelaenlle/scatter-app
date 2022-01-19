//
//  ScheduleView.swift
//  TrackerApp
//
//  Created by Miguel Aenlle on 11/14/21.
//

import SwiftUI

struct ScheduleView: View {
    var scheduleData: Schedule
    var emphasized: Bool = false
    
    var body: some View {
        
        HStack {
            
            VStack(alignment: .leading) {
                TextView(text: scheduleData.className, size: 20, fontWeight: .bold, color: emphasized ? .white: darkOrange)
                
                TextView(text: "Period \(scheduleData.period)", size: 16, fontWeight: .medium, color: emphasized ? .white: .gray)
                SpacingView(height: 20)
                
            }
            .padding(10)
            Spacer()
            VStack(alignment: .trailing) {
                Spacer()
                VStack {
                    HStack {
                        EmailTeacher(email: scheduleData.teacherEmail, emphasized: emphasized)
                        Spacer().frame(width: 20)
                    }
                    SpacingView(height: 20)
                }
                Spacer()
            }
            
        }
        .padding(.vertical, 10)
        .background(emphasized ? darkOrange: backgroundGray)
        .cornerRadius(5)
    }
}
