

import UIKit

class CustomTableViewCell: UITableViewCell {

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
    
    private let titlePost: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "testTitle"
        $0.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        $0.textColor = .systemGray
        
        return $0
    }(UILabel())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(_ post: Post){
        titlePost.text = post.title
        imagePost.image = post.image
        authorPost.text = post.author
    }
    
    private func layout(){
        
        [whiteView, titlePost, imagePost, authorPost].forEach{contentView.addSubview($0)}
        
        NSLayoutConstraint.activate([
            whiteView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            whiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            whiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            whiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            
            authorPost.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 16),
            authorPost.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 16),
            authorPost.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -16),
            authorPost.bottomAnchor.constraint(equalTo: imagePost.topAnchor, constant: -16),
            
            imagePost.topAnchor.constraint(equalTo: authorPost.bottomAnchor, constant: 0),
            imagePost.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 0),
            imagePost.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: 0),
            imagePost.heightAnchor.constraint(equalTo: imagePost.widthAnchor),
            
            titlePost.topAnchor.constraint(equalTo: imagePost.bottomAnchor, constant: 16),
            titlePost.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 16),
            titlePost.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -16),
            titlePost.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -16)
        ])
    }
}
