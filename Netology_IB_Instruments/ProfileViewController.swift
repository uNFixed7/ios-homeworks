//
//  ProfileViewController.swift
//  Netology_IB_Instruments


import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        print("screenWidth = \(screenWidth)")
        print("screenHeight = \(screenHeight)")
        
        if let myView = Bundle.main.loadNibNamed("ProfileView", owner: nil, options: nil)?.first as? ProfileView {
            myView.frame = CGRect(x: 16, y: 50, width: screenWidth - 32, height: 400)
            view.addSubview(myView)
        }
    }

}
