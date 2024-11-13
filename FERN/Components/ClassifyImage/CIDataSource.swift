//
//  CIDataSource.swift
//  FERN
//
//  Created by Hopp, Dan on 11/13/24.
/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
Provides the structure and functions that process the images based on the classification request.
*/


import Vision

struct ImageFile {
    // The local URL of the image.
    let url: URL
    let name: String
    // The dictionary that holds an image's classification identifier and confidence value.
    var observations: [String: Float] = [:]
    
    init(url: URL) {
        self.url = url
        self.name = url.lastPathComponent
    }
}

// Returns an `ImageFile` object based on the `ClassifyImageRequest` results.
func classifyImage(url: URL) async throws -> ImageFile {
    var imageObservations = ImageFile(url: url)
    
    // Vision request to classify an image. Access the possible classifications through the supportedIdentifiers property.
    let request = ClassifyImageRequest()
    
    // Perform the request on the image, and return an array of `ClassificationObservation` objects.
    // Increasing precision decreases recall, and increasing recall decreases precision.
    let results = try await request.perform(on: url)
        // Use `hasMinimumPrecision` for a high-recall filter. Provides a much broader range of observations, but can result in more false positive results.
        .filter { $0.hasMinimumPrecision(0.1, forRecall: 0.8) }
        // Use `hasMinimumRecall` for a high-precision filter. Retains a smaller number of observations, but less chance to contain false positives.
        // .filter { $0.hasMinimumRecall(0.01, forPrecision: 0.9) }
    
    // Add each classification identifier and its respective confidence level into the observations dictionary.
    for classification in results {
        imageObservations.observations[classification.identifier] = classification.confidence
    }
    
    return imageObservations
}

// Processes all the selected images concurrently.
func classifyAllImages(urls: [URL]) async throws -> [ImageFile] {
    var images = [ImageFile]()
    
    try await withThrowingTaskGroup(of: ImageFile.self) { group in
        for url in urls {
            group.addTask {
                return try await classifyImage(url: url)
            }
        }
        
        for try await image in group {
            images.append(image)
        }
    }
    
    return images
}
