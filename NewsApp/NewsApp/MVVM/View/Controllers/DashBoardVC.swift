//
//  ViewController.swift
//  NewsApp
//
//  Created by Varshitha VRaj on 28/07/25.
//

import UIKit

class DashBoardVC: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: CustomCollectionView!
    
    private let viewModel = DashboardViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        initalSetUp()
        viewModel.getNews(for: "general")
    }
    
    func initalSetUp(){
        
        self.collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CustomCollectionViewCellsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCollectionViewCellsCollectionViewCell")
        collectionView.layer.borderColor = UIColor.lightGray.cgColor
        collectionView.layer.borderWidth = 1.0
        
        viewModel.onNewsFetched = { [weak self] news in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
        
    }
    
    
}


extension DashBoardVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let numberOfArticles = viewModel.articles?.count {
            print("the number of articles are: \(String(describing: viewModel.articles?.count))")
            return numberOfArticles
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCellsCollectionViewCell", for: indexPath) as! CustomCollectionViewCellsCollectionViewCell
        
        if let data = viewModel.articles?[indexPath.row] {
            print("the title is: \(data.title)")
            
            cell.titleLabel.text = "\(data.title)"
            
            if let imageURL = data.image {
                print("the image url is \(imageURL)")
                cell.imageView.loadImage(from: imageURL)
            }
        }
        
        return cell
    }
}

