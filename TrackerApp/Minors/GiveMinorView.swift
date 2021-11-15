//
//  GiveMinorView.swift
//  TrackerApp
//
//  Created by Pink Flamingo on 11/14/21.
//

import SwiftUI
import FirebaseFirestore

struct GiveMinorView: View {
    let db = Firestore.firestore()
    @State var currentTask = "Other"
    @State var description = ""
    let minorTypes = [
        "Profanity",
        "Shouting",
        "Rude Behavior",
        "Other"
    ]
    var userID: String?
    
    var giveMinor: (() -> Void)?
    
    
    func getDateString() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        return dateFormatter.string(from: date)
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                VStack {
                    VStack {
                    TextView(text: "Minor Type", fontWeight: .bold)
                        ForEach(minorTypes, id: \.self) { minorType in
                            HStack {
                                Spacer()
                                VStack {
                                    SpacingView(height: 20)
                                    TextView(text: minorType)
                                    SpacingView(height: 20)
                                }
                                Spacer()
                            }
                            .background(currentTask != minorType ? Color.white : darkOrange)
                            .cornerRadius(15)
                            .shadow(color: black.opacity(0.1), radius: 20, x: 0, y: 10)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 5)
                            .onTapGesture {
                                withAnimation {
                                    self.currentTask = minorType
                                }
                            }

                        }
                    }
                    .padding(.vertical, 20)
                }
                .background(Color.white)
                .cornerRadius(15)
                .shadow(color: black.opacity(0.1), radius: 20, x: 0, y: 10)
                .padding(20)
                
                VStack {
                    VStack {
                        TextView(text: "Description", fontWeight: .bold)
                        TextEditor(text: $description)
                            .frame(height: 300)
                            .background(Color.white)
                            .cornerRadius(15)
                            .shadow(color: black.opacity(0.1), radius: 20, x: 0, y: 10)
                            .padding(.horizontal, 20)
                    }
                    .padding(.vertical, 20)
                }
                .background(Color.white)
                .cornerRadius(15)
                .shadow(color: black.opacity(0.1), radius: 20, x: 0, y: 10)
                .padding(20)
                Button {
                    print("Add minor")
                    if let id = userID {
                        let minorCollection = db.collection("students").document(id).collection("minors")
                        let data: [String:  Any] = [
                            "title": currentTask,
                            "description": description,
                            "timestamp": getDateString()
                        ]
                        minorCollection.addDocument(data: data) { error in
                            
                            giveMinor?()
                        }
                            
                        
                    }
                } label: {
                    ButtonView(text: "Add Minor")
                        .padding(20)
                }

                SpacingView(height: 100)
                
            }.onTapGesture {
                self.hideKeyboard()
            }
        }
            
    }
}

struct GiveMinorView_Previews: PreviewProvider {
    static var previews: some View {
        GiveMinorView()
    }
}
