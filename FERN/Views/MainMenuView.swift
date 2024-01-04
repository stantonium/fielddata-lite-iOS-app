//
//  MainMenuView.swift
//  FERN
//
//  Created by Hopp, Dan on 2/3/23.
//

import SwiftUI

struct MainMenuView: View {
    
    let persistenceController = PersistenceController.shared
    
    var body: some View {
        NavigationStack{
            List {
                NavigationLink {
                   SelectSavedRouteView()
                        .navigationTitle("Load Saved Route")
                } label: {
                    HStack {
                        Image(systemName: "map").bold(false).foregroundColor(.gray)
                        Text("Load Saved Route")
                    }
                }
                NavigationLink {
                    SelectAreaView(phpFile: "menusAndReports.php", columnName: "area_name")
                        .navigationTitle("Select Area")
                } label: {
                    HStack {
                        Image(systemName: "rectangle.dashed").bold(false).foregroundColor(.gray)
                        Text("Select Area")
                    }
                }
                NavigationLink {
                    SelectAreaView(phpFile: "menusAndReports.php",  columnName: "plot_name")
                        .navigationTitle("Select Plot")
                } label: {
                    HStack {
                        Image(systemName: "rectangle.center.inset.fill").bold(false).foregroundColor(.gray)
                        Text("Select Plot")
                    }
                }
                NavigationLink {
                    SelectReportView(phpFile: "menusAndReports.php")
                        .navigationTitle("Select Report")
                } label: {
                    HStack {
                        Image(systemName: "newspaper").bold(false).foregroundColor(.gray)
                        Text("Reports")
                    }
                }
                NavigationLink {
                    SelectNotesView(phpFile: "notes.php")
                        .navigationTitle("Notes")
                } label: {
                    HStack {
                        Image(systemName: "pencil.line").bold(false).foregroundColor(.gray)
                        Text("Notes")
                    }
                }
                // Simple view to see NMEA Arrow Gold Data stream
//                NavigationLink {
//                    NMEADataView()
//                        .navigationTitle("GPS Stream")
//                } label: {
//                    HStack {
//                        Image(systemName: "antenna.radiowaves.left.and.right").bold(false).foregroundColor(.gray)
//                        Text("GPS Stream")
//                    }
//                }
                NavigationLink {
                    SelectTripView()
                        .navigationTitle("GPS Camera").environment(\.managedObjectContext, persistenceController.container.viewContext)
                } label: {
                    HStack {
                        Image(systemName: "camera").bold(false).foregroundColor(.gray)
                        Text("GPS Camera")
                    }
                }
                // Upload checked trips
                NavigationLink {
                    UploadTripsView()
                        .navigationTitle("Upload Completed Trips")
                } label: {
                    HStack {
                        Image(systemName: "square.and.arrow.up").bold(false).foregroundColor(.gray)
                        Text("Upload Completed Trips")
                    }
                }
            }.bold().onAppear(perform:{ UIApplication.shared.isIdleTimerDisabled = false})
            }//.preferredColorScheme(.dark)
        }
    }
