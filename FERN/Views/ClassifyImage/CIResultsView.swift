//
//  CIResultsView.swift
//  FERN
//
//  Created by Hopp, Dan on 11/13/24.
//
/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
Displays the image's classification identifiers and respective confidence levels.
*/

import SwiftUI
import Vision

struct CIResultsView: View {
    var image: ImageFile
    
    var body: some View {
        ZStack {
            List {
                if image.observations.isEmpty {
                    Text("No observations found with significant confidence.")
                        .font(.title2)
                        .padding(10)
                }
                
                ForEach(image.observations.sorted(by: { $0.value > $1.value }), id: \.key) { key, value in
                    Text("\(value, specifier: "%.2f"): \(key.capitalized)")
                        .font(.title2)
                        .padding(10)
                }
            }
            
            // A view that asynchronously loads and displays an image.
            AsyncImage(url: image.url) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .aspectRatio(contentMode: .fit)
            .opacity(0.2)
        }
    }
}
