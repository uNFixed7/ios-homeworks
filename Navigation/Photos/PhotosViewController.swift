

import UIKit

class PhotosViewController: UIViewController {
    
    private var photos: [UIImage] = {
        var photos = [UIImage]()

        for i in 1...20 {
            let photo = UIImage(named: "\(i)")
            photos.append(photo ?? UIImage(named: "ponch")!)
        }
        return photos
    }()
    
    private let blackView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        $0.isHidden = true
        $0.frame = UIScreen.main.bounds
        return $0
    }(UIView())
    
    private let closeButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .blue
        $0.setTitle("Close", for: .normal)
        $0.addTarget(self, action: #selector(photoPressedClose), for: .touchUpInside)
        return $0
    }(UIButton())
    
    private var imagePhoto: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "ponch")
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.isUserInteractionEnabled = true
        $0.backgroundColor = .systemPink
        return $0
    }(UIImageView())
    
    private let layoutCol: UICollectionViewFlowLayout = {
        $0.scrollDirection = .vertical
       return $0
    }(UICollectionViewFlowLayout())
    
    private lazy var collectionView: UICollectionView = {
        $0.translatesAutoresizingMaskIntoConstraints = false 
        $0.backgroundColor = .systemBackground
        $0.dataSource = self
        $0.delegate = self
        $0.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: layoutCol))

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Photo Gallery"
        layout()
    }
    
    private func layout(){
    
        [collectionView, blackView].forEach{view.addSubview($0)}
        [closeButton, imagePhoto].forEach{blackView.addSubview($0)}
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            blackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            blackView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            
            imagePhoto.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            imagePhoto.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            imagePhoto.centerXAnchor.constraint(equalTo: blackView.centerXAnchor),
            imagePhoto.centerYAnchor.constraint(equalTo: blackView.centerYAnchor),
            
            closeButton.bottomAnchor.constraint(equalTo: imagePhoto.topAnchor),
            closeButton.trailingAnchor.constraint(equalTo: blackView.trailingAnchor)
        ])
    }
}

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell
        
        cell.tapPhotoDelegate = self
        cell.setupCell(photos[indexPath.item])
        
        return cell
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout{
    
    private var inset: CGFloat { return 8 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (collectionView.bounds.width - inset * 4) / 3
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        inset 
    }
}

extension PhotosViewController: UICollectionViewDelegate {
    
}

extension PhotosViewController: TapPhotoDelegate {
    func photoPressed(photoView: UIImageView) {
        
        imagePhoto.image = photoView.image
        
        UIView.animate(withDuration: 0.5,
                       delay: 0.1,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 0.3,
                       options: .curveEaseInOut) {
            
            self.navigationController?.isNavigationBarHidden = true
            self.tabBarController?.tabBar.isHidden = true
            self.blackView.isHidden = false
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func photoPressedClose() {
        
        UIView.animate(withDuration: 0.5,
                       delay: 0.1,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 0.3,
                       options: .curveEaseInOut) {
            
            self.navigationController?.isNavigationBarHidden = false
            self.tabBarController?.tabBar.isHidden = false
            self.blackView.isHidden = true
            self.view.layoutIfNeeded()
        }
    }
}
