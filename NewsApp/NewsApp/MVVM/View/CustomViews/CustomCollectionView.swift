//
//  CustomCollectionView.swift
//  NewsApp
//
//  Created by Varshitha VRaj on 29/07/25.
//

import UIKit

class CustomCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout {
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.delegate = self
            self.collectionViewLayout = UICollectionViewFlowLayout() // ✅ forces flow layout

            if let layout = self.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
                layout.minimumInteritemSpacing = 10
                layout.minimumLineSpacing = 10
            }

            print("✅ Layout is: \(type(of: self.collectionViewLayout))")
    }

    
    
    
    func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            let padding: CGFloat = 10
            let interItemSpacing: CGFloat = 10
            let totalSpacing = padding * 2 + interItemSpacing
            let availableWidth = collectionView.bounds.width
            
            let widthPerItem = (availableWidth - totalSpacing) / 2
            
            print("available width: \(availableWidth), width per item: \(availableWidth)")
            
            return CGSize(width: widthPerItem, height: availableWidth - 150) // square cells
        }

        func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 10
        }

        func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 10
        }
    
}
