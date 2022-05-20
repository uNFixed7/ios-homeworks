

import UIKit

class PostTableViewCell: UITableViewCell {
    
    private weak var postViewDelegate: PostViewDelegate?
    
    private let whiteView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
    
    private let authorPost: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .black
        $0.numberOfLines = 2
        $0.text = "New title"
        return $0
    }(UILabel())
    
    private let imagePost: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "ponch")
        $0.contentMode = .scaleAspectFit
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
        backgroundColor = .systemBackground
        layout()
        
        let tapLike = UITapGestureRecognizer(target: self, action: #selector(tapLike))
        likesPost.addGestureRecognizer(tapLike)
        likesPost.isUserInteractionEnabled = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(_ postViewDelegate: PostViewDelegate?) {
        if let postViewDelegate = postViewDelegate {
            self.postViewDelegate = postViewDelegate
            authorPost.text = postViewDelegate.post.author
            imagePost.image = postViewDelegate.post.image
            likesPost.text = "Likes: \(postViewDelegate.post.likes)"
            viewsPost.text = "Views: \(postViewDelegate.post.views)"
            desciptionPost.text = postViewDelegate.post.description
        } else {
            authorPost.text = "Def author"
            imagePost.image = nil
            likesPost.text = "Likes: 0"
            viewsPost.text = "Views: 0"
            desciptionPost.text = "Def desc"
        }
    }
    
    
    private func layout() {
        [whiteView, authorPost, newStack, imagePost, desciptionPost].forEach{contentView.addSubview($0)}
        
        newStack.addArrangedSubview(likesPost)
        newStack.addArrangedSubview(viewsPost)
        
        let screenSize: CGRect = UIScreen.main.bounds
        let inset: CGFloat = 16
        
        NSLayoutConstraint.activate([
            
            whiteView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            whiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            whiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            whiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            
            authorPost.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: inset),
            authorPost.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: inset),
            authorPost.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -inset),
            
            imagePost.topAnchor.constraint(equalTo: authorPost.bottomAnchor, constant: inset),
            imagePost.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor),
            imagePost.widthAnchor.constraint(equalToConstant: screenSize.width),
            imagePost.heightAnchor.constraint(equalToConstant: screenSize.width),
            
            desciptionPost.topAnchor.constraint(equalTo: imagePost.bottomAnchor, constant: inset),
            desciptionPost.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: inset),
            desciptionPost.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -inset),
            
            newStack.topAnchor.constraint(equalTo: desciptionPost.bottomAnchor, constant: inset),
            newStack.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: inset),
            newStack.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -inset),
            newStack.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor,constant: -inset)
        ])
    }
    
    @objc private func tapLike() {
        postViewDelegate?.postLikePressed()
        likesPost.text = "Likes: \(postViewDelegate!.post.likes)"
    }
}
