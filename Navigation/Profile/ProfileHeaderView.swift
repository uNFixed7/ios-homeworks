

import Foundation
import UIKit

class ProfileHeaderView: UIView {
    
    private lazy var textToPrint: String = statusTextField.text ?? ""
    
    private let whiteView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
    
    private let blackView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        $0.isHidden = true
        return $0
    }(UIView())
    
    private let closeButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .blue
        $0.setTitle("Close", for: .normal)
        $0.addTarget(self, action: #selector(hideAction), for: .touchUpInside)
        return $0
    }(UIButton())
    
    private let fullNameLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Ponchik sweet dog"
        $0.numberOfLines = 1
        $0.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        $0.textColor = .black
        return $0
    }(UILabel())
    
    private let avatarImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named:"ponch")
        $0.layer.cornerRadius = 50
        $0.layer.borderWidth = 3
        $0.isUserInteractionEnabled = true
        $0.layer.borderColor = UIColor.white.cgColor
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    private let substrateImageView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
    
    private let statusLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Waiting for something.."
        $0.numberOfLines = 1
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.textColor = .gray
        return $0
    }(UILabel())
    
    private let statusTextField: UITextField = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.placeholder = "Waiting for something.."
        $0.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: $0.frame.height))
        $0.leftViewMode = .always
        $0.textColor = .black
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.backgroundColor = UIColor.white.cgColor
        $0.layer.cornerRadius = 12
        $0.addTarget(self, action: #selector(textChanged), for: .editingChanged)
        return $0
    }(UITextField())
    
    private let setStatusButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .blue
        $0.layer.cornerRadius = 20
        $0.layer.shadowRadius = 4
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.7
        $0.layer.shadowOffset = CGSize(width: 4, height: 4)
        $0.setTitle("Show status", for: .normal)
        $0.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        return $0
    }(UIButton())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray6
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        addGestureRecognizer(tapGesture)
        
        let tapAvatar = UITapGestureRecognizer(target: self, action: #selector(showAction))
        avatarImageView.addGestureRecognizer(tapAvatar)
        
        isUserInteractionEnabled = true
        
        layout()
    }
    
    private func layout()
    {
        
        addSubview(whiteView)
        
        [fullNameLabel,statusLabel,statusTextField,setStatusButton,blackView,substrateImageView,avatarImageView].forEach{whiteView.addSubview($0)}
        
        blackView.addSubview(closeButton)
        
        let inset: CGFloat = 16
        
        NSLayoutConstraint.activate([
            
            
            whiteView.topAnchor.constraint(equalTo: self.topAnchor),
            whiteView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            whiteView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            whiteView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
       
            
            substrateImageView.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: inset),
            substrateImageView.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: inset),
            substrateImageView.widthAnchor.constraint(equalToConstant: 100),
            substrateImageView.heightAnchor.constraint(equalToConstant: 100),
            
            blackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            blackView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            
            avatarImageView.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: inset),
            avatarImageView.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: inset),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            
            closeButton.topAnchor.constraint(equalTo: blackView.topAnchor),
            closeButton.trailingAnchor.constraint(equalTo: blackView.trailingAnchor),
            
            fullNameLabel.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: substrateImageView.trailingAnchor, constant: inset),
            
            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 34),
            statusLabel.leadingAnchor.constraint(equalTo: substrateImageView.trailingAnchor, constant: inset),
            
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 8),
            statusTextField.leadingAnchor.constraint(equalTo: substrateImageView.trailingAnchor, constant: inset),
            statusTextField.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -inset),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            
            setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: inset),
            setStatusButton.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: inset),
            setStatusButton.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -inset),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        statusTextField.resignFirstResponder()
    }
    
    @objc private func tapAction() {
        if textToPrint == "" {
            statusTextField.attributedPlaceholder = NSAttributedString(
                string: "Cannot be empty!",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.red]
            )
        } else {
            statusTextField.attributedPlaceholder = NSAttributedString(
                string: "Waiting for something..",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
            )
            statusLabel.text = textToPrint
        }
    }
    
    @objc private func showAction(){
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0.1,
            usingSpringWithDamping: 1,
            initialSpringVelocity: 0.3,
            options: .curveEaseInOut) { [self] in
                
                self.blackView.isHidden = false
                
                self.avatarImageView.layer.position = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY)
                
                self.avatarImageView.layer.bounds = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
         
              //  self.closeButton.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor).isActive = true
                
               // self.closeButton.layer.position = CGPoint(x: avatarImageView.layer.position.x + 150, y: avatarImageView.layer.position.y - 220)
                
                self.avatarImageView.layer.cornerRadius = 0
                self.layoutIfNeeded()
            }
    }
    
    @objc private func hideAction(){
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0.1,
            usingSpringWithDamping: 1,
            initialSpringVelocity: 0.3,
            options: .curveEaseInOut) {
                
                self.avatarImageView.layer.position = self.substrateImageView.layer.position
                
                self.avatarImageView.layer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
  
                self.blackView.isHidden = true
                self.layoutIfNeeded()
                self.avatarImageView.layer.cornerRadius = self.avatarImageView.bounds.width / 2
            }
    }
    
    @objc private func textChanged(_ textField: UITextField) {
        textToPrint = textField.text!
    }
}
