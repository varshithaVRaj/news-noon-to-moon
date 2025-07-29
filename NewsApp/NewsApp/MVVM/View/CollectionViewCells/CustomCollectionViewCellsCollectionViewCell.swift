//
//  CustomCollectionViewCellsCollectionViewCell.swift
//  NewsApp
//
//  Created by Varshitha VRaj on 28/07/25.
//

import UIKit

class CustomCollectionViewCellsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var customView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        customView.layer.borderColor = UIColor.red.cgColor
        customView.layer.borderWidth = 1
        customView.layer.cornerRadius = 10
        
        titleLabel.numberOfLines = 5
        titleLabel.lineBreakMode = .byWordWrapping
       
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        
    }
    


}
