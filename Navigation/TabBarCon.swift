

import UIKit

class TabBarCon: UITabBarController {
    
    let firstVC = FeedViewController()
    let secondVC = ProfileViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCon()
    }
    
    private func setupCon() {
        firstVC.tabBarItem.title = "Feed"
        firstVC.tabBarItem.image = UIImage(systemName: "bolt")
        firstVC.navigationItem.title = "User feed"
        
        secondVC.tabBarItem.title = "Profile"
        secondVC.tabBarItem.image = UIImage(systemName: "person")
        secondVC.navigationItem.title = "User profile"
        
        let navController1 = UINavigationController(rootViewController: firstVC)
        let navController2 = UINavigationController(rootViewController: secondVC)
        
        viewControllers = [navController1, navController2]
    }
}
