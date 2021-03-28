//
//  Competition.swift
//  platzi-test
//
//  Created by Ivan Mosquera on 26/3/21.
//

import Foundation

struct Competition: Codable {
    let id: Int
    let area: Area
    let name: String
    let code: String?
    let plan: String?
    let lastUpdated: String?
    
    static var `default`: Competition{
        .init(id: 0, area: Area.default, name: "", code: "", plan: "", lastUpdated: "")
    }
}


