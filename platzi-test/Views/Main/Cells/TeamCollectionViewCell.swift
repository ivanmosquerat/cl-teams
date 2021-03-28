//
//  TeamCollectionViewCell.swift
//  platzi-test
//
//  Created by Ivan Mosquera on 26/3/21.
//

import UIKit
import Kingfisher
import SVGKit

class TeamCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCellWith(name:String, flag:String){
        nameLabel.text = name
        debugPrint(flag)
        flagImageView.kf.setImage(with: URL(string: flag), options: [.processor(SVGImgProcessor())])
    }

}
