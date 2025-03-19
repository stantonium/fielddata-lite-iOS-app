//
//  ExpeditionSDTestingView.swift
//  FERN
//
//  Created by Hopp, Dan on 1/2/25.
//

//import SwiftUI
//import SwiftData
//
//struct ExpeditionSDTestingView: View {
//    
//    @Environment(\.modelContext) var context
//    @Query var expeditions: [Expedition]
//    
//    @State private var showingTripNameAlert = false
//    @State private var name = ""
//    
//    var body: some View {
//        // Toggle or hamburger to filter completed/not completed?
////        Form {
////            Section("Trips") {
//        NavigationView {
//            List {
//                ForEach(expeditions) { expedition in
////                    Text("\(expedition.name)")
//                    NavigationLink {
//                        if !expedition.isComplete {
//                            TripCompleteView()
//                        } else {
//                            TripCompleteView()
//                        }
//                    } label: {
//                        Text(expedition.name)
//                    }
//                }
//                //                }
//                //            }
//            }.toolbar {
//                //                    ToolbarItem(placement: .navigationBarTrailing) {
//                //                        EditButton()
//                //                    }
//                ToolbarItem {
//                    // Pop up a text field to add a Trip name
//                    Button(action: showTripNameAlert) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                    // Enter trip name alert
//                    .alert("Enter a trip name", isPresented: $showingTripNameAlert) {
//                        TextField("Trip Name", text: $name).foregroundStyle(.purple)
//                        Button("OK", action: addItem)
//                        Button("Cancel", role: .cancel){name = ""}
//                    } message: {
//                        Text("The name must be unique, must have only alphanumeric characters (- and _ are allowed), and cannot contain any spaces.")
//                    }
//                }
//            }
//        }
//    }
//    
//    private func addItem() {
//        let trimmed = name.trimmingCharacters(in: .whitespacesAndNewlines)
//        if trimmed.count > 0 {
//            withAnimation {
//                // Remove special characters
//                let pattern = "[^A-Za-z0-9_-]+"
//                name = name.replacingOccurrences(of: pattern, with: "", options: [.regularExpression])
//                context.insert(Expedition(name: name, expeditionEnum: .trip))
//            }
//        }
//        name = ""
//    }
//    
//    private func showTripNameAlert(){
//        showingTripNameAlert.toggle()
//    }
//}
