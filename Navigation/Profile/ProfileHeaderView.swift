

import Foundation
import UIKit

class ProfileHeaderView: UIView {
    
    private lazy var textToPrint: String = statusTextField.text ?? ""
    
    private var avatarImageViewLeading = NSLayoutConstraint()
    private var avatarImageViewTop = NSLayoutConstraint()
    private var avatarImageViewWidth = NSLayoutConstraint()
    private var avatarImageViewHeight = NSLayoutConstraint()
    private var avatarImageViewX = CGFloat()
    private var avatarImageViewY = CGFloat()

    
    private let whiteView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
    
    private let blackView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .black
        
        $0.isHidden = true
        $0.alpha = 0.5
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
        
        isUserInteractionEnabled = true
        
        layout()
        setupGestures()
    }
    
    @objc private func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        statusTextField.resignFirstResponder()
    }
    
    func setupGestures(){
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showAction))

        avatarImageView.addGestureRecognizer(tapGesture)
    }
    
    private func layout()
    {
        
        addSubview(whiteView)
        
        [fullNameLabel,statusLabel,statusTextField,setStatusButton,blackView,substrateImageView,avatarImageView].forEach{whiteView.addSubview($0)}
        
        blackView.addSubview(closeButton)
        
        let inset: CGFloat = 16
        
        avatarImageViewLeading = avatarImageView.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: inset)
        avatarImageViewTop = avatarImageView.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: inset)
        avatarImageViewWidth = avatarImageView.widthAnchor.constraint(equalToConstant: 100)
        avatarImageViewHeight = avatarImageView.heightAnchor.constraint(equalToConstant: 100)
        
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
            
            closeButton.topAnchor.constraint(equalTo: blackView.topAnchor),
            closeButton.trailingAnchor.constraint(equalTo: blackView.trailingAnchor),
            
            avatarImageViewTop,
            avatarImageViewLeading,
            avatarImageViewWidth,
            avatarImageViewHeight,
            
            fullNameLabel.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: substrateImageView.trailingAnchor, constant: inset),
            
            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 34),
            statusLabel.leadingAnchor.constraint(equalTo: substrateImageView.trailingAnchor, constant: inset),
            
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 8),
            statusTextField.leadingAnchor.constraint(equalTo: substrateImageView.trailingAnchor, constant: inset),
            statusTextField.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -inset),
            
            setStatusButton.topAnchor.constraint(equalTo: substrateImageView.bottomAnchor, constant: inset),
            setStatusButton.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: inset),
            setStatusButton.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -inset),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapAction() {
        print(textToPrint)
        statusLabel.text = textToPrint
    }
    
    @objc func showAction(){
        
        avatarImageViewX = self.avatarImageView.center.x
        avatarImageViewY = self.avatarImageView.center.y
        
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
            }
        print("Test")
    }
    
    @objc func hideAction(){
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0.1,
            usingSpringWithDamping: 1,
            initialSpringVelocity: 0.3,
            options: .curveEaseInOut) {
                self.avatarImageView.center = CGPoint(x: self.avatarImageViewX, y: self.avatarImageViewY)
                self.avatarImageViewTop.constant = self.whiteView.bounds.minY + 16
                self.avatarImageViewLeading.isActive = true
                self.avatarImageViewWidth.constant = 100
                self.avatarImageViewHeight.constant = 100
                self.blackView.isHidden = true
                self.layoutIfNeeded()
                self.avatarImageView.layer.cornerRadius = self.avatarImageView.bounds.width / 2
            }
    }
    
    @objc func textChanged(_ textField: UITextField) {
        textToPrint = textField.text!
    }
}
