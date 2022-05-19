

import UIKit

class TabBarCon: UITabBarController {
    
    let firstVC = FeedViewController()
    let secondVC = LogInViewController()
    
    let statusBarView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .systemGray6
        return $0
    }(UIView())

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCon()
        layout()
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
        
        UITabBar.appearance().backgroundColor = .white
        UINavigationBar.appearance().backgroundColor = .white
       // UINavigationBar.appearance().isHidden = true
        
        viewControllers = [navController1, navController2]
    }
    
    
    func layout()
    {
        view.addSubview(statusBarView)
        
        NSLayoutConstraint.activate([
            statusBarView.topAnchor.constraint(equalTo: view.topAnchor),
            statusBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            statusBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            statusBarView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
}
