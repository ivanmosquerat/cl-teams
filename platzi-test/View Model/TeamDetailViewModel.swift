//
//  MatchViewModel.swift
//  platzi-test
//
//  Created by Ivan Mosquera on 27/3/21.
//

import UIKit

protocol TeamDetailViewModelDelegate {
    func reloadData()
}

class TeamDetailViewModel {
    
    private var matches: [Match] = []
    var delegate: TeamDetailViewModelDelegate?
   
    var numberOfMatches: Int{
        return matches.count
    }
    
    func getMatches(teamId: Int){
        
        guard let baseUrl = URL(string: "https://api.football-data.org/v2/teams/\(teamId)/matches?limit=20") else
        {
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
