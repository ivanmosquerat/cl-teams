//
//  Segues.swift
//  platzi-test
//
//  Created by Ivan Mosquera on 30/3/21.
//

import Foundation

enum Segues: String {
    case toTeamDetail
    case toMatchDetail
    
    var identifier: String{
        switch self {
        
        case .toTeamDetail:     return "segueToDetail"
        case .toMatchDetail:    return "segueToMatchDetail"
        
        }
    }
}
