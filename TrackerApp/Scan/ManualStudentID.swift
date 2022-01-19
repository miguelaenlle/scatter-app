//
//  ManualStudentID.swift
//  Teacherd
//
//  Created by Pink Flamingo on 11/30/21.
//

import SwiftUI
import FirebaseFirestore

struct ManualStudentID: View {
    @ObservedObject var mainDetailViewModel: MainDetailViewModel
    @Binding var presentingScannerSheet: Bool
    @Binding var isPresenting: Bool
    @Binding var presentDetailView: Bool
    @State var value: String = ""
    let db = Firestore.firestore()
    func addInformation() {
        print("add data")
        mainDetailViewModel.resetErrors()
        
        db.collection("students").whereField("studentID", isEqualTo: value).getDocuments() { (querySnapshot, err) in
            print("collecting student data.")
            if let err = err {
                print(err)
                mainDetailViewModel.addError("Student not found.")
            } else {
            
                guard let documents = querySnapshot?.documents else {
                
                    mainDetailViewModel.addError("Student not found.")
            
                    return
                }
                
                print(documents)
                if documents.count > 0 {
                    let studentData = documents[0]
                    let id = studentData.documentID
                    
                    presentingScannerSheet = false
                    mainDetailViewModel.processScan(scannedData: id) { completed in
                        presentingScannerSheet = true
                        if (completed) {

                            presentDetailView = true
                            // open the detail sheet

                        }

                    }
                } else {
                    mainDetailViewModel.addError("Student not found.")
                    
                    
                }
            }
        }
        
        
    }
    var body: some View {
        VStack {
            if (isPresenting) {
                HStack {
                    TextFieldView(text: $value, placeholderText: "Enter ID here", keyboardType: .numpad)
                        .background(Color.white)
                        .cornerRadius(5)
                        .shadow(color: black.opacity(0.1), radius: 20, x: 0, y: 10)
                    Button {
                        self.addInformation()
                    } label: {
                        Image(systemName: "chevron.right")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 20)
                            .foregroundColor(.white)
                            .shadow(color: black.opacity(0.1), radius: 20, x: 0, y: 10)
                            .padding(20)
                            .background(Color.clear)
                    }
                
                    

                }
                .padding(30)
            }
        }
        HStack {
            if !isPresenting {
                Button {
                    withAnimation {
                        isPresenting = true
                    }
                } label: {
                    ButtonView(text: "Manual Input", invertedColorscheme: true)
                    
                }
            }
        }
        .padding(.horizontal, 60)
    }
}
