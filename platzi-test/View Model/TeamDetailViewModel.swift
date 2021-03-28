//
//  MatchViewModel.swift
//  platzi-test
//
//  Created by Ivan Mosquera on 27/3/21.
//

import UIKit

protocol TeamDetailViewModelDelegate {
    func reloadData()
    
    func getTeamId() -> Int
}

class TeamDetailViewModel {
    
    private var matches: [Match] = []
    var delegate: TeamDetailViewModelDelegate?
    
    
    init(){
        
        // TODO: FIX FOR EACH TEAM
        getMatches(url: "https://api.football-data.org/v2/teams/\(delegate?.getTeamId() ?? 1)/matches?limit=20")
    }
    
    var numberOfMatches: Int{
        return matches.count
    }
    
    func getMatches(url: String){
        
        guard let baseUrl = URL(string: url) else {
            return
        }
        
        var urlRequest = URLRequest(url: baseUrl)
        urlRequest.setValue("c2903c8861b04090ab8856b71cdcb6d1", forHTTPHeaderField: "X-Auth-Token")
        
        let task = URLSession.shared.dataTask(with: urlRequest){ (data, _ , error) in
            
            if let error = error{
                
                debugPrint(error)
                return
            }
            
            guard let data = data else {
                return
            }
            
            let dataFromJson = try! JSONDecoder().decode(MatchResponse.self, from: data)
            
            self.matches = dataFromJson.matches
            
            DispatchQueue.main.async {
                self.delegate?.reloadData()
            }
            
        }
        
        task.resume()
    }
    
    func item(at indexPath: IndexPath) -> Match{
        return matches[indexPath.row]
    }

}
