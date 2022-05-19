

import Foundation
import UIKit

class ProfileHeaderView: UIView {
    
    private lazy var textToPrint: String = textInput.text ?? ""
    
    let textLabel: UILabel = {
        let text = UILabel(frame: CGRect(x: 130, y: 27, width: UIScreen.main.bounds.width, height: 20))
        text.text = "Sweet avatar"
        text.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        text.textColor = .black
        return text
    }()
    
    let userPic: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 16, y: 10, width: 100, height: 100))
        image.image = UIImage(named:"ponch")
        image.layer.cornerRadius = 50
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        image.clipsToBounds = true
        return image
    }()
    
    let textInput: UITextField = {
      
        let text = UITextField(frame: CGRect(x: 130, y: 57, width: UIScreen.main.bounds.width, height: 20))
        text.text = "Waiting for something.."
        text.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        text.textColor = .gray
        text.addTarget(self, action: #selector(textChanged), for: .editingChanged)
        return text
    }()
    
    let blueButton: UIButton = {
        let butto = UIButton(frame: CGRect(x: 16, y: 120, width: UIScreen.main.bounds.width - 32, height: 50))
        butto.backgroundColor = .blue
        butto.layer.cornerRadius = 20
        butto.layer.shadowRadius = 4
        butto.layer.shadowColor = UIColor.black.cgColor
        butto.layer.shadowOpacity = 0.7
        butto.layer.shadowOffset = CGSize(width: 4, height: 4)
        butto.setTitle("Show status", for: .normal)
        butto.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        return butto
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        addSubview(userPic)
        addSubview(textLabel)
        addSubview(textInput)
        addSubview(blueButton)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapAction() {
        print(textToPrint)
        textLabel.text = textToPrint
    }
    
    @objc func textChanged(_ textField: UITextField) {
        textToPrint = textField.text!
    }
}
