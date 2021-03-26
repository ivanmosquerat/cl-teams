//
//  Match.swift
//  platzi-test
//
//  Created by Ivan Mosquera on 27/3/21.
//

import Foundation

struct Match {
    let id: Int
    let competition: Competition
    let season: Season
    let utcDate: String
    let status: String
    let matchDay: Int
    let stage: Int
    let group: String
    let lastUpdated: String
    let odds: Odds?
    let score: Score
    let homeTeam: Team
    let awayTeam: Team
    let referees: Referee
    
    static var `default` : Match {
        .init(id: 0, competition: Competition.default, season: Season.default, utcDate: "", status: "", matchDay: 0, stage: 0, group: "", lastUpdated: "", odds: Odds.default, score: Score.default, homeTeam: Team.default, awayTeam: Team.default, referees: Referee.default)
    }
}

struct Odds {
    let msg: String?
    
    static var `default`: Odds{
        .init(msg: "")
    }
}