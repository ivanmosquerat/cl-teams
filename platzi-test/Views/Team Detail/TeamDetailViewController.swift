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

        matchesCollectionView.delegate = self
        matchesCollectionView.dataSource = self
        matchesCollectionView.register(UINib(nibName: Cells.matchCollectionViewCell.id, bundle: nil), forCellWithReuseIdentifier: Cells.matchCollectionViewCell.id)
        
    }
    
}

// MARK: - UICollectionViewDelegate
extension TeamDetailViewController: UICollectionViewDelegate{
    
}

// MARK: - UICollectionViewDataSource
extension TeamDetailViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cells.matchCollectionViewCell.id, for: indexPath) as? MatchCollectionViewCell else {
            
            return UICollectionViewCell()
        }
        
        //cell.setupCellWith(match: matchesDataSource[indexPath.row])
        
        return cell
    }
    
    
}
