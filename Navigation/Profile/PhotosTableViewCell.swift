
import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    weak var myParent:ProfileViewController?
    
    private var photos: [UIImage] = {
        var photos = [UIImage]()

        for i in 1...4 {
            let photo = UIImage(named: "\(i)")
            photos.append(photo ?? UIImage(named: "ponch")!)
        }
        return photos
    }()

    private let whiteView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        return $0
    }(UIView())
    
    private let titlePhotos: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        $0.textColor = .black
       // $0.numberOfLines = 2
        $0.text = "Photos"
        return $0
    }(UILabel())
    
    private let arrowLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        $0.textColor = .black
       // $0.numberOfLines = 2
        $0.text = "->"
        return $0
    }(UILabel())
    
    private let layoutCol: UICollectionViewFlowLayout = {
        $0.scrollDirection = .horizontal
       return $0
    }(UICollectionViewFlowLayout())
    
    private lazy var collectionView: UICollectionView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
       // $0.backgroundColor = .gray
        $0.isScrollEnabled = false
        $0.isUserInteractionEnabled = false 
        $0.dataSource = self
        $0.delegate = self
        $0.register(PrePhotosCollectionViewCell.self, forCellWithReuseIdentifier: PrePhotosCollectionViewCell.identifier)
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: layoutCol))
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layout() {
        
        [whiteView, titlePhotos, arrowLabel,  collectionView].forEach{contentView.addSubview($0)}
    
        //let screenSize: CGRect = UIScreen.main.bounds
        let inset: CGFloat = 12
        
        NSLayoutConstraint.activate([
            whiteView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            whiteView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            whiteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            whiteView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            
            titlePhotos.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: inset),
            titlePhotos.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: inset),
            
            arrowLabel.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: inset),
            arrowLabel.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -inset),
            
            collectionView.topAnchor.constraint(equalTo: titlePhotos.bottomAnchor, constant: inset),
            collectionView.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -inset)
        ])
    }
}
    

extension PhotosTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PrePhotosCollectionViewCell.identifier, for: indexPath) as! PrePhotosCollectionViewCell
        
        cell.setupCell(photos[indexPath.item])
        
        cell.myParent = self.myParent
        
        return cell
    }
}

extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout {
    
    private var inset: CGFloat { return 12 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (collectionView.bounds.width - inset * 5) / 4
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
    
}

/*
extension PhotosTableViewCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("test!")
        let photosVC = PhotosViewController()
        myParent?.navigationController?.pushViewController(photosVC, animated: true)
    }
    
}
 */
