//
//  CombiendSchedules.swift
//  Teacherd
//
//  Created by Pink Flamingo on 1/19/22.
//

import SwiftUI

struct CombinedSchedules: View {
    @ObservedObject var mainDetailViewModel: MainDetailViewModel
    @State var selectedSchedule: String = "Today"
    @State var constrained = true
    
    var handleInfoChange: (() -> Void)?
    var body: some View {
        
        VStack(alignment: .leading) {
            VStack {
                SpacingView(height: 30)
                TextView(text: "Schedule", size: 22, fontWeight: .bold, color: .black)
                    .padding(.horizontal, 10)
                HStack {
                    Spacer()
                    Button(action: {
                        if (selectedSchedule == "Full") {
                            selectedSchedule = "Today"
                        } else {
//                                if let student = mainDetailViewModel.student {
//                                    mainDetailViewModel.extractSchedule(studentID: student.studentID)
//
//                                }
                            selectedSchedule = "Full"
                        }
                    }) {
                        
                        Slider(selectedElement: $selectedSchedule, elements: ["Today", "Full"])
                            .padding(.horizontal, 10)
                        
                    }
                    Spacer()
                    
                }
                ScrollView(showsIndicators: false) {
                    
                    SpacingView(height: 30)
                    if (selectedSchedule == "Full") {
                        FullScheduleView(mainDetailViewModel: mainDetailViewModel)
                        
                    } else {
                        TodaySchedule(mainDetailViewModel: mainDetailViewModel)
                    }
                    
                    
                    
                }
                .frame(maxHeight: constrained ? 400 : .infinity)
                
                SpacingView(height: 30)
                HStack {
                    Spacer()
                    Button(action: {
                        constrained = !constrained
                    }) {
                        TextView(text: constrained ? "Maximize" : "Minimize", size: 20, fontWeight: .medium, color: .blue)
                    }
                 
                    Spacer()
                }
                SpacingView(height: 20)
            }
            .padding(5)
        
        }
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: black.opacity(0.1), radius: 20, x: 0, y: 10)
        .padding(20)
    }
}

