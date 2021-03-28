//
//  Referee.swift
//  platzi-test
//
//  Created by Ivan Mosquera on 27/3/21.
//

import Foundation

struct Referee: Codable {
    let id: Int
    let name: String
    let role: String
    let nationality: String
    
    static var `default`: Referee {
        .init(id: 0, name: "", role: "", nationality: "")
    }
}
