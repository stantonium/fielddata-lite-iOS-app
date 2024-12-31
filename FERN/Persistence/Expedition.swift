//
//  Expedition.swift
//  FERN
//
//  Created by Hopp, Dan on 12/31/24.
//
//  Expedition and Point are M:M

import Foundation
import SwiftData

@Model
class Expedition {
    @Attribute(.unique) var id: UUID
    var name: String
    var isComplete: Bool
    var createdOn: Date
    var lastUpdatedOn: Date // Required?
    var allItemsUploaded: Bool
    var expeditionEnumID: Int
    var expeditionEnum: ExpeditionEnum {
        ExpeditionEnum(rawValue: expeditionEnumID)!
    }
    
    init(
        id: UUID = UUID(),
        name: String,
        isComplete: Bool = false,
        createdOn: Date = Date(),
        lastUpdatedOn: Date = Date(),
        allItemsUploaded: Bool = false,
        expeditionEnum: ExpeditionEnum
    ) {
        self.id = id
        self.name = name
        self.isComplete = isComplete
        self.createdOn = createdOn
        self.lastUpdatedOn = lastUpdatedOn
        self.allItemsUploaded = allItemsUploaded
        self.expeditionEnumID = expeditionEnum.rawValue
    }
    
    @Relationship
    var points: [Point] = []
}
