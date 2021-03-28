//
//  TeamCollectionViewCell.swift
//  platzi-test
//
//  Created by Ivan Mosquera on 26/3/21.
//

import UIKit

class TeamCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
     
        flagImageView.clipsToBounds = true
        flagImageView.layer.cornerRadius = flagImageView.frame.size.height / 2
       
    }
    
    func setupCellWith(name:String, flag:String){
        nameLabel.text = name
    }

}
