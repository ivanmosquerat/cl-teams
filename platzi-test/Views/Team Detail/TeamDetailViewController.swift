//
//  TeamDetailViewController.swift
//  platzi-test
//
//  Created by Ivan Mosquera on 27/3/21.
//

import UIKit

class TeamDetailViewController: UIViewController {
    
    // MARK: - Properties
    private var matchesDataSource: [Match] = []
    private var viewModel = TeamDetailViewModel()
    var team: Team = Team.default
    
    // MARK: - Outlets
    @IBOutlet weak var teamImageView: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamAreaLabel: UILabel!
    @IBOutlet weak var matchesCollectionView: UICollectionView!
    @IBOutlet weak var teamVenueLabel: UILabel!
    @IBOutlet weak var colorsContainerView: UIView!
    @IBOutlet weak var venueContainerView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.delegate = self
        matchesCollectionView.delegate = self
        matchesCollectionView.dataSource = self
        matchesCollectionView.register(UINib(nibName: Cells.matchCollectionViewCell.id, bundle: nil), forCellWithReuseIdentifier: Cells.matchCollectionViewCell.id)
        
        setupUI()
    }
    
    func setupUI(){
        teamNameLabel.text = team.name
        teamImageView.kf.setImage(with: URL(string: team.crestUrl ?? ""), options: [.processor(SVGImgProcessor())])
        teamAreaLabel.text = team.area?.name
        teamVenueLabel.text = team.venue
        
    }
    
}

// MARK: - ViewModelDelegate
extension TeamDetailViewController: TeamDetailViewModelDelegate{
    func getTeamId() -> Int {
        return team.id ?? 1
    }
    
    func reloadData() {
        matchesCollectionView.reloadData()
    }
    
    
}

// MARK: - UICollectionViewDelegate
extension TeamDetailViewController: UICollectionViewDelegate{
    
}

// MARK: - UICollectionViewDataSource
extension TeamDetailViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return viewModel.numberOfMatches
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cells.matchCollectionViewCell.id, for: indexPath) as? MatchCollectionViewCell else {
            
            return UICollectionViewCell()
        }
        
        cell.setupCellWith(match: viewModel.item(at: indexPath))
        
        return cell
    }
    
    
}
