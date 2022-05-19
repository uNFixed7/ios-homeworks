

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    private let imagePhoto: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "ponch")
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.backgroundColor = .systemPink
        return $0
    }(UIImageView())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(_ photo: UIImage){
        imagePhoto.image = photo
    }
    
    private func layout(){
        [imagePhoto].forEach{contentView.addSubview($0)}
        
          NSLayoutConstraint.activate([
            imagePhoto.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            imagePhoto.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            imagePhoto.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            imagePhoto.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
            ])
    }
}
