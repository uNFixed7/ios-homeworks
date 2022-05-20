

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    var post = Post(title: "", description: "", author: "", likes: 0, views: 0)
    
    weak var tapViewDelegate: TapViewDelegate?

    private let whiteView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .systemBackground
        
        return $0
    }(UIView())

    private let authorPost: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "testAuthor"
        $0.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        
        return $0
    }(UILabel())
    
    private let imagePost: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "ponch")
        $0.backgroundColor = .black
        
        return $0
    }(UIImageView())
    
    private let desciptionPost: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 0
        $0.textColor = .systemGray
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return $0
    }(UILabel())
    
    private let newStack: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.distribution = .equalSpacing
        return $0
    }(UIStackView())
    
    private let likesPost: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return $0
    }(UILabel())
    
    private let viewsPost: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return $0
    }(UILabel())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
        
        setupGestures()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(_ post: Post){
        imagePost.image = post.image
        authorPost.text = post.author
        likesPost.text = "Likes: \(post.likes)"
        viewsPost.text = "Views: \(post.views)"
        desciptionPost.text = post.description
        self.post = post
    }
    
    func setupGestures(){
        
        let tapLike = UITapGestureRecognizer(target: self, action: #selector(postLikePressed))
        likesPost.addGestureRecognizer(tapLike)
        likesPost.isUserInteractionEnabled = true
        
        
        let tapPost = UITapGestureRecognizer(target: self, action: #selector(tapView))
        imagePost.addGestureRecognizer(tapPost)
        imagePost.isUserInteractionEnabled = true
        
    }
    
    private func layout(){
        
        [whiteView, imagePost, authorPost, desciptionPost, newStack].forEach{contentView.addSubview($0)}
        
        newStack.addArrangedSubview(likesPost)
        newStack.addArrangedSubview(viewsPost)
        
        let inset: CGFloat = 16
        
        NSLayoutConstraint.activate([
            whiteView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            whiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            whiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            whiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            
            authorPost.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: inset),
            authorPost.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: inset),
            authorPost.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -inset),
            authorPost.bottomAnchor.constraint(equalTo: imagePost.topAnchor, constant: -inset),
            
            imagePost.topAnchor.constraint(equalTo: authorPost.bottomAnchor, constant: 0),
            imagePost.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 0),
            imagePost.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: 0),
            imagePost.heightAnchor.constraint(equalTo: imagePost.widthAnchor),
            
            desciptionPost.topAnchor.constraint(equalTo: imagePost.bottomAnchor, constant: inset),
            desciptionPost.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: inset),
            desciptionPost.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -inset),
            
            newStack.topAnchor.constraint(equalTo: desciptionPost.bottomAnchor, constant: inset),
            newStack.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: inset),
            newStack.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -inset),
            newStack.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor,constant: -inset)
        ])
    }
    
    @objc private func tapView() {
        
        // let detailVC = PostViewController(post: post)
         //navigationController?.pushViewController(detailVC, animated: true)
        
        post.views += 1
        viewsPost.text = "Views: \(post.views)"
        
        self.tapViewDelegate?.postImagePressed(postViewDelegate: self)
    }
}

extension CustomTableViewCell: PostViewDelegate {
    
    @objc func postLikePressed() {
        self.post.likes += 1
        self.likesPost.text = "Likes: \(self.post.likes)"
    }
}
