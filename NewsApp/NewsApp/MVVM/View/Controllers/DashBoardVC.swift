//
//  ViewController.swift
//  NewsApp
//
//  Created by Varshitha VRaj on 28/07/25.
//

import UIKit

class DashBoardVC: UIViewController {
    
    @IBOutlet weak var collectionView: CustomCollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        initalSetUp()
    
        
    }
    
    func initalSetUp(){
        
        self.collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CustomCollectionViewCellsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCollectionViewCellsCollectionViewCell")
        
       
    }


}


extension DashBoardVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCellsCollectionViewCell", for: indexPath) as! CustomCollectionViewCellsCollectionViewCell
        
        
        
        return cell
    
    }
    
    
}

