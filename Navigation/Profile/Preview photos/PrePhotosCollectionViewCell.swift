

import UIKit

class PrePhotosCollectionViewCell: UICollectionViewCell {
    
    weak var myParent:ProfileViewController?
    
    private let imagePhoto: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "ponch")
       // $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 6
        $0.backgroundColor = .black
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

        contentView.addSubview(imagePhoto)
        
         NSLayoutConstraint.activate([
            imagePhoto.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            imagePhoto.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            imagePhoto.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            imagePhoto.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
            ])
    }/*
    @objc private func tapAction() {
        deleg2?.buttonPressed(number: number)
        
        print("Tap")
        
        print(myParent)
        
        let photosVC = PhotosViewController()
        myParent?.navigationController?.pushViewController(photosVC, animated: true)
    }*/
}


