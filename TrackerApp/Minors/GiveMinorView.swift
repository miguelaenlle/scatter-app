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
    @State var constrained = true
    let minorTypes = [
        "Irresponsible Language",
        "Incorrect Mask Use",
        "Red Zone Noise",
        "Loitering",
        "Leaving Trash",
        "Dress Decorum",
        "Horseplay",
        "Playing Loud Music",
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
        VStack {
            VStack {
                ScrollView(showsIndicators: true) {
                    VStack {
                        HStack {
                            TextView(text: "Minor Type", size: 22, fontWeight: .bold, color: .black)
                        }
                        ForEach(minorTypes, id: \.self) { minorType in
                            HStack {
                                Spacer()
                                VStack {
                                    SpacingView(height: 20)
                                    TextView(text: minorType, fontWeight: .medium, color: currentTask != minorType ? .black: .white)
                                    SpacingView(height: 20)
                                }
                                Spacer()
                            }
                            .background(currentTask != minorType ? midGray : darkOrange)
                            .cornerRadius(5)
                            .padding(.vertical, 5)
                            .onTapGesture {
                                withAnimation {
                                    self.currentTask = minorType
                                }
                            }

                        }
                    }
                    .padding(.vertical, 20)
                    .padding(.horizontal, 15)
                }
                .frame(maxHeight: constrained ? 400 : .infinity)
                .padding(.horizontal, 5)
                SpacingView(height: 30)
                HStack {
                    Spacer()
                    Button(action: {
                        constrained = !constrained
                    }) {
                        TextView(text: constrained ? "Maximize" : "Minimize", fontWeight: .medium, color: .blue)
                    }
                 
                    Spacer()
                }
                SpacingView(height: 20)
            }
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: black.opacity(0.1), radius: 20, x: 0, y: 10)
            .padding(20)
        
            VStack {
                VStack {
                    TextView(text: "Description", fontWeight: .bold)
                    ZStack {
                        
                        TextEditor(text: $description)
                            .font(.system(size: 16))
                            .frame(height: 300)
                            .padding(5)
                            .foregroundColor(darkGray)
                        if (description.isEmpty) {
                            VStack {
                                HStack {
                                    TextView(text: "Describe the incident... (optional)", size: 16, color: midGray)
                                    Spacer()
                                }
                                Spacer()
                            }
                            .padding(10)
                        }
                        
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(midGray, lineWidth: 2)
                    )
                }
                .padding(.vertical, 20)
                .padding(.horizontal, 20)
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

struct GiveMinorView_Previews: PreviewProvider {
    static var previews: some View {
        GiveMinorView()
    }
}
