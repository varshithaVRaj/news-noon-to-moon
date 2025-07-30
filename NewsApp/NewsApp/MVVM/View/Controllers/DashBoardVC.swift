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
        viewModel.getNews(for: "general", page: 1)
    }
    
    private func initalSetUp(){
        
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
            
            if let titleOfArticle = data.title {
                print("the title of the article is: \(titleOfArticle)")
                cell.titleLabel.text = "\(titleOfArticle)"
            }
        
            if let imageURL = data.urlToImage {
                print("the image url is \(imageURL)")
                cell.imageView.loadImage(from: imageURL)
            }
            
            if let author = data.author {
                cell.authorLabel.text = "\(author)"
            }
            
            if indexPath.row == (viewModel.articles?.count ?? 0) - 1 {
                print("the total articles are: \(String(describing: viewModel.articles?.count))")
                   viewModel.loadNextPageIfNeeded(for: "general")
               }
               
        
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        
    }
    
}




