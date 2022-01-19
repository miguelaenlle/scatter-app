//
//  DetailView.swift
//  TrackerApp
//
//  Created by Miguel Aenlle on 11/14/21.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var mainDetailViewModel: MainDetailViewModel
    @Binding var presentDetailView: Bool
    @State var giveMinorOn: Bool = false
    @State var viewFullSchedule: Bool = false
    
    
    
    
    func handlePageChange() {
        if (giveMinorOn) {
            giveMinorOn = false
        } else {
            presentDetailView = false
            
        }
    }
    
    
    var body: some View {
        if let studentData = mainDetailViewModel.student {
            ZStack {
                backgroundGray
                    .ignoresSafeArea()
                VStack {
                    ScrollView() {
                        StudentDetailHeader(studentName: studentData.studentName, studentEmail: studentData.studentEmail, backClicked: handlePageChange)
                        if !giveMinorOn {
                            StudentInformationView(giveMinorOn: $giveMinorOn, mainDetailViewModel: mainDetailViewModel, studentData: studentData)
                        } else {
                            
                            GiveMinorView(userID: studentData.studentID, giveMinor: {
                                self.mainDetailViewModel.regenMinors()
                                self.giveMinorOn = false
                            })
                        }
                    }
                }
            }
        }
    }
}
