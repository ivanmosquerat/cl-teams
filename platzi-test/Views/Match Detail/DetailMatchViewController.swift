//
//  DetailMatchViewController.swift
//  platzi-test
//
//  Created by Ivan Mosquera on 30/3/21.
//

import UIKit

class DetailMatchViewController: UIViewController {
    
    // MARK: - Properties
    var match: Match = Match.default
    
    // MARK: - Outlets
    @IBOutlet weak var leagueLabel: UILabel!
    @IBOutlet weak var matchDayLabel: UILabel!
    @IBOutlet weak var homeTeamLabel: UILabel!
    @IBOutlet weak var awayTeamLabel: UILabel!
    @IBOutlet weak var homeTeamScoreLabel: UILabel!
    @IBOutlet weak var awayTeamScoreLabel: UILabel!
    @IBOutlet weak var mainRefereeLabel: UILabel!
    @IBOutlet weak var assisst1NameLabel: UILabel!
    @IBOutlet weak var assisst2Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeView))
        
        setupUI()
    }
    
    private func setupUI(){
        
        if match.score.winner == "HOME_TEAM"{
            homeTeamLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
            homeTeamScoreLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
            awayTeamLabel.font = UIFont.systemFont(ofSize: 17, weight: .light)
            awayTeamScoreLabel.font = UIFont.systemFont(ofSize: 17, weight: .light)
        }
        
        if match.score.winner == "AWAY_TEAM"{
            homeTeamLabel.font = UIFont.systemFont(ofSize: 17, weight: .light)
            homeTeamScoreLabel.font = UIFont.systemFont(ofSize: 17, weight: .light)
            awayTeamLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
            awayTeamScoreLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        }
        
        leagueLabel.text = match.competition?.name ?? "League not available"
        matchDayLabel.text = "Match day: \(match.matchday ?? 0)"
        
        homeTeamLabel.text = match.homeTeam?.name ?? "Team name not available"
        homeTeamScoreLabel.text = "\(match.score.fullTime?.homeTeam ?? 0)"
        
        awayTeamLabel.text = match.awayTeam?.name ?? "Team name not available"
        awayTeamScoreLabel.text = "\(match.score.fullTime?.awayTeam ?? 0)"
        
        mainRefereeLabel.text = match.referees?[0].name ?? ""
        assisst1NameLabel.text = match.referees?[1].name ?? ""
        assisst2Label.text = match.referees?[2].name ?? ""
        
    }
    
    @objc func closeView(){
        self.dismiss(animated: true, completion: nil)
    }
}
