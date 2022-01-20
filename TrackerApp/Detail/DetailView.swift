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
    @State var gaveMinor: Bool = false
    
    
    var body: some View {
        if let studentData = mainDetailViewModel.student {
            ZStack {
                backgroundGray
                    .ignoresSafeArea()
                if !giveMinorOn {
                    ScrollView(showsIndicators: false) {
                        
                        StudentDetailHeader(studentName: studentData.studentName, studentEmail: studentData.studentEmail, backClicked: handlePageChange)
                        StudentInformationView(giveMinorOn: $giveMinorOn, mainDetailViewModel: mainDetailViewModel, studentData: studentData)
                    }
                    
                } else {
                    ScrollView(showsIndicators: false) {
                        StudentDetailHeader(studentName: studentData.studentName, studentEmail: studentData.studentEmail, backClicked: handlePageChange)
                        GiveMinorView(userID: studentData.studentID, giveMinor: {
                            self.mainDetailViewModel.regenMinors()
                            self.giveMinorOn = false
                            self.gaveMinor = true
                        })
                    }
                    
                }
            }.alert(isPresented: $gaveMinor) {
                Alert(
                    title: Text("Minor successfully added."),
                    message: Text("The minor has successfully been added to the database."),
                    dismissButton: .default(Text("Okay")) {
                        self.gaveMinor = false
                    }
                )
            }
        } 
    }
}
