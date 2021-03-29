//
//  TeamDetailViewController.swift
//  platzi-test
//
//  Created by Ivan Mosquera on 27/3/21.
//

import UIKit

class TeamDetailViewController: UIViewController {
    
    // MARK: - Properties
    private lazy var emptyView: UIView = {
        guard let view = Bundle.main.loadNibNamed("EmptyViewMatches", owner: nil, options: [:])?.first as? UIView else{
            
            return UIView()
        }
        
        return view
    }()
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
    @IBOutlet weak var colorsStackView: UIStackView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var teamLinkButtom: UIButton!
    
    // MARK: - Actions
    @IBAction func openTeamLink(_ sender: Any) {
        if let url = URL(string: team.website ?? ""){
            
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.delegate = self
        matchesCollectionView.delegate = self
        matchesCollectionView.dataSource = self
        matchesCollectionView.register(UINib(nibName: Cells.matchCollectionViewCell.id, bundle: nil), forCellWithReuseIdentifier: Cells.matchCollectionViewCell.id)
        
        viewModel.getMatches(teamId: team.id ?? 1)
        setupUI()
    }
    
    func setupUI(){
        teamNameLabel.text = team.name
        teamImageView.kf.setImage(with: URL(string: team.crestUrl ?? ""), options: [.processor(SVGImgProcessor())])
        teamAreaLabel.text = team.area?.name
        teamVenueLabel.text = team.venue
        teamLinkButtom.setTitle(team.website ?? "Website not available", for: .normal) 
        
        createColorsViews()
    }
    
    func createColorsViews(){
        
        for color in team.colors{
    
            let view = UIView()
            view.frame.size = CGSize(width: 50, height: 50)
            view.backgroundColor = color
            view.layer.cornerRadius = 12
            
            colorsStackView.addArrangedSubview(view)
            
            view.translatesAutoresizingMaskIntoConstraints = false
            let widthConstraint = NSLayoutConstraint(item: view, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 50)
            let heightConstraint = NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 50)
            
            NSLayoutConstraint.activate([widthConstraint, heightConstraint])
            
        }
    }
    
}

// MARK: - ViewModelDelegate
extension TeamDetailViewController: TeamDetailViewModelDelegate{
    
    func reloadData() {
        activityIndicator.stopAnimating()
        matchesCollectionView.backgroundView = viewModel.numberOfMatches == 0 ? emptyView : nil
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
