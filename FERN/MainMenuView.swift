//
//  MainMenuView.swift
//  FERN
//
//  Created by Hopp, Dan on 2/3/23.
//

import SwiftUI

struct MainMenuView: View {
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
                    CameraView()
                        .navigationTitle("Save and Upload Photo")
                } label: {
                    HStack {
                        Image(systemName: "camera").bold(false).foregroundColor(.gray)
                        Text("Save and Upload Photo")
                    }
                }
                NavigationLink {
                    UploadImageView()
                        .navigationTitle("Upload Image Only")
                } label: {
                    HStack {
                        Image(systemName: "arrow.up.and.person.rectangle.portrait").bold(false).foregroundColor(.gray)
                        Text("Upload Image Only")
                    }
                }
                }.bold()
            }
        }
    }

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
