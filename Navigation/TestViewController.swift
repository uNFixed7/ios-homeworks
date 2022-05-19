

import UIKit

class TestViewController: UIViewController {

    let phv = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(phv)
        
        phv.translatesAutoresizingMaskIntoConstraints = false 
        
        NSLayoutConstraint.activate([
            phv.topAnchor.constraint(equalTo: view.topAnchor),
            phv.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            phv.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            phv.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    


}
