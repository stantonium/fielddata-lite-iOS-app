//
//  Point.swift
//  FERN
//
//  Created by Hopp, Dan on 1/2/25.
//
//  Point and Expedition are M:M

//import Foundation
//import SwiftData
//
//@Model
//class Point {
//    @Attribute(.unique) var id: UUID
//    var createdOn: Date
//    var name: String
//    var latitude: Double
//    var longitude: Double
//    var hdop: Double
//    var altitude: Double
//    var r: Int
//    var g: Int
//    var b: Int
//    
//    @Relationship(inverse: \Expedition.points)
//    var expeditions: [Expedition] = []
//    
//    init(id: UUID = UUID(), createdOn: Date = Date(), name: String = "", latitude: Double = 0, longitude: Double = 0, hdop: Double = 0, altitude: Double = 0, r: Int = 0, g: Int = 0, b: Int = 0) {
//        self.id = id
//        self.createdOn = createdOn
//        self.name = name
//        self.latitude = latitude
//        self.longitude = longitude
//        self.hdop = hdop
//        self.altitude = altitude
//        self.r = r
//        self.g = g
//        self.b = b
//    }
//}
