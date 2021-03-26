//
//  CellIds.swift
//  platzi-test
//
//  Created by Ivan Mosquera on 26/3/21.
//

import Foundation

enum Cells: String {
    case teamCollectionViewCell
    
    var id: String{
        switch self {
        case .teamCollectionViewCell:   return "TeamCollectionViewCell"
        
        }
    }
}
