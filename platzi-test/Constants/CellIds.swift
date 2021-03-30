//
//  CellIds.swift
//  platzi-test
//
//  Created by Ivan Mosquera on 26/3/21.
//

import Foundation

enum Cells: String {
    case teamCollectionViewCell
    case matchCollectionViewCell
    
    var id: String{
        switch self {
        case .teamCollectionViewCell:   return "TeamCollectionViewCell"
        
        case .matchCollectionViewCell:  return "MatchCollectionViewCell"
        }
    }
    
    var UInib: String{
        switch self {
        
        case .teamCollectionViewCell:   return "TeamCollectionViewCell"
            
        case .matchCollectionViewCell:  return "MatchCollectionViewCell"

        }
    }
}
