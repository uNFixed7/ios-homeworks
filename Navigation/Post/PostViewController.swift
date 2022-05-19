//
//  PostViewController.swift
//  Navigation
//
//  Created by antonfrolov on 05.04.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    var post = Post(title: "Def title", description: "Def desc", author: "Noname", likes: 0, views: 0)
    
    
    private lazy var tableView: UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.dataSource = self
        $0.delegate = self
        $0.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        return $0
    }(UITableView())
    
    convenience init(post: Post){
        self.init()
        self.post = post
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = false

        view.backgroundColor = .yellow
        navigationItem.title = post.title
        
        layout()
        
        
        let barItem = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(tapBarItem))
        navigationItem.rightBarButtonItem = barItem
        
    }
    
    @objc private func tapBarItem() {
            let infoViewController = InfoViewController()
            present(infoViewController, animated: true)
        }
    
    private func layout(){
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - UITableViewDataSource

extension PostViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
       
        cell.setupCell(post)
        cell.selectionStyle = .none
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension PostViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
