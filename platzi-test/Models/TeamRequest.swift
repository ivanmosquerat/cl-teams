//
//  TeamRequest.swift
//  platzi-test
//
//  Created by Ivan Mosquera on 28/3/21.
//

import Foundation

struct TeamRequest: Codable {
    let count: Int
    //let filters:
    let competition: Competition
    let season: Season
    let teams: [Team]
}
