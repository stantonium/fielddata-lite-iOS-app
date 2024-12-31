//
//  enums.swift
//  FERN
//
//  Created by Hopp, Dan on 12/31/24.
//
//  If no raw value is associated with an enum, swift will create one column for each case.
//  When providing the first case with an integer value, each case after the first one will be assigned the next increment value.


enum ExpeditionEnum: Int, Codable {
    case trip = 1
    case route
}

enum ScoreTypeEnum: Int, Codable {
    case vitalStatus = 1
    case DBH
    case Height
}

enum scoreUnitEnum: Int, Codable {
    case cm = 1
    case mm
    case ft
    case inches
}
