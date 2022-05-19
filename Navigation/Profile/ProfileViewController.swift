

import Foundation
import UIKit


class ProfileViewController: UIViewController {
    
    let phv = ProfileHeaderView()
    let newButton: UIButton = {
        let newButton = UIButton()
        newButton.setTitle("New button", for: .normal)
        newButton.backgroundColor = .blue
        return newButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.view.backgroundColor = .lightGray
        view.addSubview(phv)
        view.addSubview(newButton)
        layout()
        
    }
    
    private func layout(){

        phv.translatesAutoresizingMaskIntoConstraints = false
        phv.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        phv.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        phv.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        phv.heightAnchor.constraint(equalToConstant: 220).isActive = true
        
        newButton.translatesAutoresizingMaskIntoConstraints = false
        newButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        newButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        newButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        newButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
