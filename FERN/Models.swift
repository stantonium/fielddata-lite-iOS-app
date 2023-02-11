//
//  Models.swift
//  FERN
//
//  Created by Hopp, Dan on 2/1/23.

import Foundation
import CoreLocation
import MapKit
//import UIkit // Needed for MapAnnotationItem's color. Apparently I need to change some swiftc options
                // to build the project against proper sdk and target?

// Model object for html root
class HtmlRootModel: Codable {
    var htmlRoot = "http://covid-samples01.ornl.gov/fielddata-lite"
}

class MapPointSize {
    let size: CGFloat = 35
}

// Model object for SelectAreaView.
class SelectNameModel: Codable, Identifiable {
    var name = ""
}

// Model for SelectNoteView
struct SelectNoteModel: Codable, Identifiable, Hashable {
    var id = ""
    var note = ""
    var confirmDelete = false
    
    enum CodingKeys: CodingKey {
        case id, note
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(note, forKey: .note)
    }

    init() { }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(String.self, forKey: .id)
        note = try container.decode(String.self, forKey: .note)
    }
    
}

//// Region???
//class Region {
//     var region = MKCoordinateRegion()
//}

// temp list for display and insertion into MapAnnotationItem
struct TempMapPointModel: Identifiable { //}, Hashable {
    let id = UUID() // DO NOT SET TO MUTABLE
    var siteId = ""
    var organismName = ""
    var lat = ""
    var long = ""
    
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
    
            try container.encode(siteId, forKey: .siteId)
            try container.encode(organismName, forKey: .organismName)
            try container.encode(lat, forKey: .lat)
            try container.encode(long, forKey: .long)
        }
    
        init() { }
    
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
    
            siteId = try container.decode(String.self, forKey: .siteId)
            organismName = try container.decode(String.self, forKey: .organismName)
            lat = try container.decode(String.self, forKey: .lat)
            long = try container.decode(String.self, forKey: .long)
        }
    
}
extension TempMapPointModel: Codable {
    enum CodingKeys: CodingKey {
        case siteId, organismName, lat, long
    }
}
class TempMapPointModel_Container: ObservableObject {
     var TempMapPointModelArray:[TempMapPointModel] = [TempMapPointModel]()
}

// Model for map annotations
struct MapAnnotationItem: Identifiable { //, Sequence, IteratorProtocol {
    let id = UUID()
    var latitude: CGFloat
    var longitude: CGFloat
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

    /* When displaying Area or Plot points, the siteId will be the unique
     ID from the database's table. Otherwise, this variable will be the
     Routing points' order number. */
    var siteId = ""
    var organismName = ""
    var systemName = ""
    var size: CGFloat = MapPointSize().size
}


// ATTEMPTED STRUCT AND CLASS REBUILD:
//// Model for map annotations
//struct MapAnnotationItem: Identifiable { //, Sequence, IteratorProtocol {
//
//    let id = UUID()
//
//    var latitude: CGFloat = 0
//    var longitude: CGFloat = 0
//
//    /* When displaying Area or Plot points, the siteId will be the unique
//     ID from the database's table. Otherwise, this variable will be the
//     Routing points' order number. */
//    var siteId = ""
//    var organismName = ""
//    var systemName = ""
//    var size: CGFloat = MapPointSize().size
//
//    var coordinate: CLLocationCoordinate2D {
//        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//
//        try container.encode(latitude, forKey: .latitude)
//        try container.encode(longitude, forKey: .longitude)
//        try container.encode(siteId, forKey: .siteId)
//        try container.encode(organismName, forKey: .organismName)
////        try container.encode(systemName, forKey: .systemName)
////        try container.encode(size, forKey: .size)
//
//    }
//
//    init() { }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//
//        latitude = try container.decode(CGFloat.self, forKey: .latitude)
//        longitude = try container.decode(CGFloat.self, forKey: .longitude)
//        siteId = try container.decode(String.self, forKey: .siteId)
//        organismName = try container.decode(String.self, forKey: .organismName)
////        systemName = try container.decode(String.self, forKey: .systemName)
////        size = try container.decode(CGFloat.self, forKey: .size)
//    }
//
//}
//extension MapAnnotationItem: Codable {
//    enum CodingKeys: String, CodingKey {
//        case latitude = "lat"
//        case longitude = "long"
//        case siteId, organismName//, systemName//, size
//    }
//}
//class MapAnnotationItem_Container: ObservableObject, Codable {
//    var MapAnnotationItemArray:[MapAnnotationItem] = [MapAnnotationItem]()
//
//    enum CodingKeys: CodingKey {
//        case MapAnnotationItemArray
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(MapAnnotationItemArray, forKey: .MapAnnotationItemArray)
//    }
//
//    init() { }
//
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        MapAnnotationItemArray = try container.decode([MapAnnotationItem].self, forKey: .MapAnnotationItemArray)
//    }
//}


// For a starting region in a map
//class StartingRegionModel: Codable, Identifiable {
//    let id = UUID() // DO NOT SET TO MUTABLE
//    var lat = ""
//    var long = ""
//    var zoom = ""
//}

//// Model for starting region annotation
//struct RegionAnnotationItem: Identifiable {
//    let id = UUID()
//
//    var latitude: Double
//    var longitude: Double
//    var zoom: Double
//
//    var center: CLLocationCoordinate2D {
//        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
//    }
//
//    var span: MKCoordinateSpan {
//        MKCoordinateSpan(latitudeDelta: zoom, longitudeDelta: zoom)
//    }
//
//    var region: MKCoordinateRegion {
//        MKCoordinateRegion (
//            center: center,
//            span: span
//        )
//    }
//}

// MAY NEVER USE OBSERVABLE IDENTIFIABLE DECODABLE OBJECT??
//class Temp_MapPointModel_ObsvObj: ObservableObject, Identifiable {  // Identifiable,
//    
//    let id = UUID()
//    
//    var siteId = ""
//    var organismName = ""
//    var geoPoint = ""
//    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//
//        try container.encode(siteId, forKey: .siteId)
//        try container.encode(organismName, forKey: .organismName)
//        try container.encode(geoPoint, forKey: .geoPoint)
//    }
//    
//    init() { }
//    
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        
//        siteId = try container.decode(String.self, forKey: .siteId)
//        organismName = try container.decode(String.self, forKey: .organismName)
//        geoPoint = try container.decode(String.self, forKey: .geoPoint)
//    }
//}
//extension Temp_MapPointModel_ObsvObj: Codable {
//    enum CodingKeys: CodingKey {
//        case siteId, organismName, geoPoint
//    }
//}
//class Temp_MapPointModel_ObsvObj_Container: ObservableObject {
//    @Published var objects = [Temp_MapPointModel_ObsvObj]()
//}



// Teeeest
class ResponseModel: Codable, Identifiable {
    var id: String? = ""
    var type: String? = ""
//    var isSelected: String? = ""
}
