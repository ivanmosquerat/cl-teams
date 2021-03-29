//
//  Score.swift
//  platzi-test
//
//  Created by Ivan Mosquera on 27/3/21.
//

import Foundation

struct Score: Codable{
    let winner: String?
    let duration: String?
    let fullTime: TimeSection?
    let halfTime: TimeSection?
    let extraTime: TimeSection?
    let penalties: TimeSection?
    

    static var `default`: Score {
        .init(winner: "", duration: "", fullTime: TimeSection.default, halfTime: TimeSection.default, extraTime: TimeSection.default, penalties: TimeSection.default)
    }
    
    
}

struct TimeSection: Codable {
    let homeTeam: Int?
    let awayTeam: Int?
    
    static var `default`: TimeSection{
        .init(homeTeam: 0, awayTeam: 0)
    }
}
