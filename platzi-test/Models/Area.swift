//
//  Area.swift
//  platzi-test
//
//  Created by Ivan Mosquera on 26/3/21.
//

import Foundation


struct Area: Codable{
    let id: Int?
    let name: String
    let code: String?
    
    static var `default`: Area{
        .init(id: 0, name: "", code: "")
    }
}
