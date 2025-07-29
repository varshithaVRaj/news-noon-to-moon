//
//  TabBarController.swift
//  NewsApp
//
//  Created by Varshitha VRaj on 28/07/25.
//

import UIKit

class TabBarController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc1 = storyboard.instantiateViewController(withIdentifier: "DashBoardVC") as? DashBoardVC else {
            fatalError("Could not load DashBoardVC from storyboard")
        }

        vc1.title = "Headlines"
        vc1.navigationItem.largeTitleDisplayMode = .always
        
        let nc1 = UINavigationController(rootViewController: vc1)
        nc1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        nc1.navigationBar.prefersLargeTitles = true
        
        self.viewControllers = [nc1]
    }


}
