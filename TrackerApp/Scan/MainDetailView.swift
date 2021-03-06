//
//  MainDetailView.swift
//  TrackerApp
//
//  Created by Miguel Aenlle on 11/11/21.
//

import SwiftUI

import CarBode

struct MainDetailView: View {
    @EnvironmentObject var userSession: UserSession
    @ObservedObject var mainDetailViewModel = MainDetailViewModel()
    @State var value: String = ""
    @State var presentingScannerSheet = true
    @State var presentDetailView: Bool = false
    @State var isPresenting: Bool = false
    
    func didDismiss() {
        // Handle the dismissing action.
        presentingScannerSheet = true
        presentDetailView = false
        mainDetailViewModel.loading = false
        mainDetailViewModel.schedule = []
        mainDetailViewModel.minors = []
        mainDetailViewModel.currentClass = nil
        mainDetailViewModel.student = nil
        mainDetailViewModel.error = nil
    }
    var body: some View {
        ZStack {
            CBScanner(
                supportBarcode: .constant([.code39, .code93, .code128]), //Set type of barcode you want to scan
                scanInterval: .constant(5.0) //Event will trigger every 5 seconds
            ){
                //When the scanner found a barcode
                
                print("BarCodeType =",$0.type.rawValue, "Value =",$0.value)
                presentingScannerSheet = false
                value = $0.value
                mainDetailViewModel.processScan(scannedData: value) { completed in
                    presentingScannerSheet = true
                    if (completed) {
                    
                        presentDetailView = true
                        // open the detail sheet
                        
                    }
                        
                }
            }
            .ignoresSafeArea()
            .onTapGesture {
                withAnimation {
                    isPresenting = false
                }
            }
            
            GeometryReader { reader in
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        if (isPresenting == false) {
                            Image(systemName: "viewfinder")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .font(Font.title.weight(.ultraLight))
                                .foregroundColor(Color.white.opacity(0.5))
                                .frame(width: (reader.size.width/2)-30, height: (reader.size.width/2)-30)
                            Spacer()
                        }
                    }
                    Spacer()
                }
            }
            VStack {
                HStack {
                    UserView()
                        .environmentObject(userSession)
                    Spacer()
                }
                .padding(.horizontal, 20)
                
                Spacer()
                
                ManualStudentID(mainDetailViewModel: mainDetailViewModel,
                                presentingScannerSheet: $presentingScannerSheet,
                                isPresenting: $isPresenting,
                                presentDetailView: $presentDetailView)
                    .padding(.bottom, 30)
                    .environmentObject(userSession)
                
            }
            
            if (mainDetailViewModel.loading) {
                Color.black.opacity(0.5).ignoresSafeArea()
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
            }
        
            
        }
        
        .fullScreenCover(isPresented: $presentDetailView,
               onDismiss: didDismiss) {
            DetailView(mainDetailViewModel: mainDetailViewModel, presentDetailView: $presentDetailView)
        }.alert(item: $mainDetailViewModel.error) { errorName in
            Alert(
                title: Text("Student doesn't exist"),
                message: Text("The student has not been added to the database yet."),
                dismissButton: .cancel() {
                    didDismiss()
                }
            )
        }
        

        
        
    }
}

struct MainDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MainDetailView()
    }
}

