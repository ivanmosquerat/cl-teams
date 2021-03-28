//
//  MainModelView.swift
//  platzi-test
//
//  Created by Ivan Mosquera on 27/3/21.
//

import Foundation

protocol MainModelViewDelegate {
    func reloadData()
}

class MainModelView {
    // MARK: - Properties
    private var championLeagueTeams: [Team] = []
    var delegate: MainModelViewDelegate?
    
    init(){
        getChampionsLeagueTeams(url: "https://api.football-data.org/v2/competitions/CL/teams")
    }
    
    var numberOfTeams: Int {
        return championLeagueTeams.count
    }
    
    // MARK: - Methods
    
    @objc private func getChampionsLeagueTeams(url: String){
        
        guard let baseUrl = URL(string: url) else {
            return
        }
        
        var url = URLRequest(url: baseUrl)
        
        url.setValue("c2903c8861b04090ab8856b71cdcb6d1", forHTTPHeaderField: "X-Auth-Token")
        
        let task = URLSession.shared.dataTask(with: url){ (data, _, error) in
            
            if let error = error {
                //handler
                debugPrint(error)
                return
            }
            
            guard let data = data else {
                return
            }
            
            let dataFromJson = try! JSONDecoder().decode(TeamResponse.self, from: data)
            
            self.championLeagueTeams = dataFromJson.teams
            
            DispatchQueue.main.async {
                self.delegate?.reloadData()
            }
        }
        
        task.resume()
        
    }
    
    func item(at indexPath: IndexPath) -> Team{
        return championLeagueTeams[indexPath.row]
    }
    
}

