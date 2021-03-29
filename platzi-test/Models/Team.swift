//
//  Team.swift
//  platzi-test
//
//  Created by Ivan Mosquera on 26/3/21.
//

import UIKit

struct Team: Codable {
    let id: Int?
    let area: Area?
    let name: String?
    let shortName: String?
    let tla: String?
    let crestUrl:String?
    let address: String?
    let phone: String?
    let website: String?
    let email: String?
    let founded: Int?
    let clubColors: String?
    let venue: String?
    let lastUpdated: String?
    
    static var `default`: Team{
        .init(id: 0, area: Area.default, name: "", shortName: "", tla: "", crestUrl: "", address: "", phone: "", website: "", email: "", founded: 0, clubColors: "", venue: "", lastUpdated: "")
    }
    
    var colors: [UIColor]{
        let strColors = clubColors ?? ""
        let arrayStrColors = strColors.components(separatedBy: " / ")
        var arrayColors: [UIColor] = []
        
        arrayStrColors.forEach{str in
            arrayColors.append(UIColor( named: str) ?? UIColor.black)
        }
        
        return arrayColors
    }
    
}
