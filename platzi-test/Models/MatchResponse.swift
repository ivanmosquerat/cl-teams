//
//  MatchResponse.swift
//  platzi-test
//
//  Created by Ivan Mosquera on 29/3/21.
//

import Foundation

struct MatchResponse: Codable {
    let count: Int
    //let filters
    //let season: Season
    let matches: [Match]
}
