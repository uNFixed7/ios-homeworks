

import UIKit

class FeedViewController: UIViewController {
    
    let newStack: UIStackView = {
        let newStack = UIStackView()
        newStack.translatesAutoresizingMaskIntoConstraints = false
        newStack.backgroundColor = .systemPink
        newStack.axis = .vertical
        newStack.spacing = 10
        newStack.distribution = .fillEqually
        return newStack
    }()
    
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
        view.addSubview(newStack)
        
        newStack.addArrangedSubview(buttonPost1)
        newStack.addArrangedSubview(buttonPost2)
        
        layout()
    }
    
    @objc private func tapAction() {
        let postViewController = PostViewController()
        postViewController.post = Post(title: "New post")
        navigationController?.pushViewController(postViewController, animated: true)
    }
    
    private func layout()
    {
        newStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        newStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        newStack.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        newStack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

    }
}
