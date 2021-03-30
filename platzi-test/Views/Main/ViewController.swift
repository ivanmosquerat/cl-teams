//
//  ViewController.swift
//  platzi-test
//
//  Created by Ivan Mosquera on 26/3/21.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    private var viewModel = MainModelView()
    private var teamSelected: Team = Team.default
    private lazy var  emptyView: UIView = {
        guard let view = Bundle.main.loadNibNamed("EmptyState", owner: nil, options: [:])?.first as? UIView else{
            
            return UIView()
        }
        
        return view
    }()
 
    // MARK: - Outlets
    @IBOutlet weak var teamsCollectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        teamsCollectionView.delegate = self
        teamsCollectionView.dataSource = self
        teamsCollectionView.register(UINib(nibName: Cells.teamCollectionViewCell.id, bundle: nil), forCellWithReuseIdentifier: Cells.teamCollectionViewCell.id)
        
        let reloadButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(reloadCompetitionData))
        
        navigationItem.rightBarButtonItems = [reloadButton]
    }
    
    // MARK: - Methods
    @objc func reloadCompetitionData(){
        activityIndicator.startAnimating()
        viewModel.reload()
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segues.toTeamDetail.identifier, let teamDetailViewController = segue.destination as? TeamDetailViewController{
            teamDetailViewController.team = teamSelected
        }
    }

}


// MARK: - MainModelViewDelegate
extension ViewController: MainModelViewDelegate{
    func reloadData() {
        activityIndicator.stopAnimating()
        teamsCollectionView.backgroundView = viewModel.numberOfTeams == 0 ? emptyView : nil
        teamsCollectionView.reloadData()
    }
}

// MARK: - UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        teamSelected = viewModel.item(at: indexPath)
        performSegue(withIdentifier: Segues.toTeamDetail.identifier, sender: nil)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.view.frame.width, height: 100)
    }
}

// MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return viewModel.numberOfTeams
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cells.teamCollectionViewCell.id, for: indexPath) as? TeamCollectionViewCell else {
            
            return UICollectionViewCell()
        }
        
        cell.setupCellWith(name: viewModel.item(at: indexPath).name ?? "", flag: viewModel.item(at: indexPath).crestUrl ?? "")
        
        return cell
    }
}

