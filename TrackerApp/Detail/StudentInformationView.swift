//
//  StudentInformationView.swift
//  Teacherd
//
//  Created by Pink Flamingo on 1/19/22.
//

import SwiftUI

struct StudentInformationView: View {
    @Binding var giveMinorOn: Bool
    @State var viewFullSchedule = false
    
    var mainDetailViewModel: MainDetailViewModel
    var handleInfoChange: (() -> Void)?
    var studentData: Student
    
    var body: some View {
    
        VStack {
            SpacingView(height: 30)
            SummaryView(mainDetailViewModel: mainDetailViewModel)
            CombinedSchedules(mainDetailViewModel: mainDetailViewModel, handleInfoChange: handleInfoChange)
            MinorList(mainDetailViewModel: mainDetailViewModel)
            
            VStack {
                Button {
                    withAnimation {
                        self.giveMinorOn = true
                    }
                } label: {
                    ButtonView(text: "Give Minor")
                }
            }.padding(20)

            
            Spacer()
        }
        .transition(.identity)
    }
}

//    VStack {
//        HStack {
//            Button {
//                withAnimation {
//                    self.giveMinorOn = false
//                }
//            } label: {
//                TextView(text: "Go back", size: 15, fontWeight: .bold, color: .white)
//                    .background(Color.clear)
//            }
//            Spacer()
//        }
//        .padding(20)
//        GiveMinorView(userID: studentData.studentID, giveMinor: {
//            self.mainDetailViewModel.regenMinors()
//            self.giveMinorOn = false
//        })
//        Spacer()
//    }
