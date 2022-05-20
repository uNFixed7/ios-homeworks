

import UIKit

class FeedViewController: UIViewController {
    
    weak var postViewDelegate: PostViewDelegate?
    
    private let newStack: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .systemPink
        $0.axis = .vertical
        $0.spacing = 10
        $0.distribution = .fillEqually
        return $0
    }(UIStackView())
    
    let buttonPost1: UIButton = {
        let buttonPost = UIButton()
        buttonPost.translatesAutoresizingMaskIntoConstraints = false
        buttonPost.setTitle("Post1", for: .normal)
        buttonPost.backgroundColor = .black
        buttonPost.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        return buttonPost
    }()
    
    let buttonPost2: UIButton = {
        let buttonPost = UIButton()
        buttonPost.translatesAutoresizingMaskIntoConstraints = false
        buttonPost.setTitle("Post2", for: .normal)
        buttonPost.backgroundColor = .black
        buttonPost.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        return buttonPost
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        
        layout()
    }
    
    @objc private func tapAction() {
        let postViewController = PostViewController()
        navigationController?.pushViewController(postViewController, animated: true)
    }
    
    private func layout()
    {
        view.addSubview(newStack)
        
        newStack.addArrangedSubview(buttonPost1)
        newStack.addArrangedSubview(buttonPost2)
        
        newStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        newStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        newStack.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        newStack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

    }
}
