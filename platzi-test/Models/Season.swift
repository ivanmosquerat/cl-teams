//
//  Season.swift
//  platzi-test
//
//  Created by Ivan Mosquera on 26/3/21.
//

import Foundation

struct Season: Codable {
    let id: Int
    let startDate: String
    let endDate: String
    let currentMatchday: Int?
    let winner: Winner?
    
    static var `default`: Season{
        .init(id: 0, startDate: "", endDate: "", currentMatchday: 0, winner: Winner.default)
    }
}

struct Winner: Codable {
    let id: Int
    let name: String
    let shortName: String
    let tla: String
    let crestUrl: String
    
    static var `default`: Winner{
        .init(id: 0, name: "", shortName: "", tla: "", crestUrl: "")
    }
}
