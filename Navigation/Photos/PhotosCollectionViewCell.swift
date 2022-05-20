

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    weak var tapPhotoDelegate: TapPhotoDelegate?
    
    private let substrateImagePhoto: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
    
    private let imagePhoto: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "ponch")
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.isUserInteractionEnabled = true
        $0.backgroundColor = .systemPink
        return $0
    }(UIImageView())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let tapPhoto = UITapGestureRecognizer(target: self, action: #selector(showAction))
        imagePhoto.addGestureRecognizer(tapPhoto)
        
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
    
    @objc private func showAction(){
        
        
        
        tapPhotoDelegate?.photoPressed(photoView: imagePhoto)
        
        //self.blackView.isHidden = false
        
        /*
        UIView.animate(
            withDuration: 0.5,
            delay: 0.1,
            usingSpringWithDamping: 1,
            initialSpringVelocity: 0.3,
            options: .curveEaseInOut) {
                
                self.blackView.isHidden = false
                self.avatarImageViewTop.constant = self.closeButton.bounds.height
                self.avatarImageViewLeading.isActive = false
                self.avatarImageViewWidth.constant = UIScreen.main.bounds.width
                self.avatarImageViewHeight.constant = UIScreen.main.bounds.width
                
                self.avatarImageView.layer.cornerRadius = 0
                self.layoutIfNeeded()
            } completion: { _ in
                UIView.animate(withDuration: 1.0,
                               delay: 0.0) {
                    self.avatarImageView.layer.cornerRadius = 0
                    
                }
            }*/
        
    }
}
