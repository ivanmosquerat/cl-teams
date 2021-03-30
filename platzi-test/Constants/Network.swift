//
//  EndPoints.swift
//  platzi-test
//
//  Created by Ivan Mosquera on 30/3/21.
//

import Foundation

enum Network: String {
    case getChampionsLeagueTeams
    
    var url:String{
        switch self {
        
        case .getChampionsLeagueTeams:  return "https://api.football-data.org/v2/competitions/CL/teams"
        }
    }
    
}
