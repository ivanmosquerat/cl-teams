//
//  MatchCollectionViewCell.swift
//  platzi-test
//
//  Created by Ivan Mosquera on 27/3/21.
//

import UIKit

class MatchCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    // MARK: - Outlets
    @IBOutlet weak var homeTeamNameLabel: UILabel!
    @IBOutlet weak var scoreHomeLabel: UILabel!
    @IBOutlet weak var awayTeamNameLabel: UILabel!
    @IBOutlet weak var scoreAwayLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCellWith(match: Match){
        
        if match.score.winner == "HOME_TEAM"{
            homeTeamNameLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
            scoreHomeLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
            awayTeamNameLabel.font = UIFont.systemFont(ofSize: 17, weight: .light)
            scoreAwayLabel.font = UIFont.systemFont(ofSize: 17, weight: .light)
        }
        
        if match.score.winner == "AWAY_TEAM" {
            homeTeamNameLabel.font = UIFont.systemFont(ofSize: 17, weight: .light)
            scoreHomeLabel.font = UIFont.systemFont(ofSize: 17, weight: .light)
            awayTeamNameLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
            scoreAwayLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        }
        
        homeTeamNameLabel.text = match.homeTeam?.name ?? "Team not available"
        scoreHomeLabel.text = "\(match.score.fullTime?.homeTeam ?? 0)"
        awayTeamNameLabel.text = match.awayTeam?.name ?? "Team not available"
        scoreAwayLabel.text = "\(match.score.fullTime?.awayTeam ?? 0)"
    }

}
