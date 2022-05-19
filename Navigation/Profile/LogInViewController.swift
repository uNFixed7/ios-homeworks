

import UIKit

class LogInViewController: UIViewController {
    
    private let nc = NotificationCenter.default
    
    private let newStack: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .systemGray6
        $0.layer.cornerRadius = 10
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.layer.borderWidth = 0.5
        $0.axis = .vertical
        $0.spacing = 0
        $0.distribution = .fillProportionally
        return $0
    }(UIStackView())
    
    private let logoImg: UIImageView = {
        $0.image = UIImage(named: "logo")
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    private lazy var loginInput: UITextField = {
        $0.placeholder = " Email or phone"
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.autocapitalizationType = .none
        $0.delegate = self
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UITextField())
    
    private let separator: UIView = {
            $0.frame = .zero
            $0.backgroundColor = .lightGray
            return $0
    }(UIView())
    
    private lazy var passwordInput: UITextField = {
        $0.placeholder = " Password"
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.autocapitalizationType = .none
        $0.isSecureTextEntry = true
        $0.delegate = self
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UITextField())
    
    private let loginButton: UIButton = {
        $0.layer.cornerRadius = 10
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("Login", for: .normal)
        $0.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        $0.clipsToBounds = true
        $0.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        return $0
    }(UIButton())
    
    private let scrollView: UIScrollView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIScrollView())
    
    private let contentView: UIView = {
        $0.backgroundColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        view.addGestureRecognizer(tapGesture)

        layout()
    }
    
    @objc private func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        passwordInput.resignFirstResponder()
        loginInput.resignFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nc.addObserver(self, selector: #selector(kbdShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(kbdHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        navigationController?.navigationBar.isHidden = true
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func kbdShow(notification: NSNotification) {
        if let kbdSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = kbdSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbdSize.height, right: 0)
        }
    }
    
    @objc private func kbdHide() {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    @objc private func tapAction() {
        let profileViewController = ProfileViewController()
        navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    private func layout(){
        
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            /// Обязательно выставить ширину contentView !!!!
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        
        contentView.addSubview(logoImg)
        
        NSLayoutConstraint.activate([
            logoImg.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImg.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImg.widthAnchor.constraint(equalToConstant: 100),
            logoImg.heightAnchor.constraint(equalToConstant: 100),
        ])
        
        contentView.addSubview(newStack)
        
        NSLayoutConstraint.activate([
            newStack.topAnchor.constraint(equalTo: logoImg.bottomAnchor, constant: 120),
            newStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            newStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            newStack.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        
        [loginInput, separator,passwordInput].forEach{newStack.addArrangedSubview($0)}
        
        NSLayoutConstraint.activate([
            
            loginInput.topAnchor.constraint(equalTo: newStack.bottomAnchor, constant: 0),
            loginInput.leadingAnchor.constraint(equalTo: newStack.leadingAnchor, constant: 0),
            loginInput.trailingAnchor.constraint(equalTo: newStack.trailingAnchor, constant: 0),
            loginInput.heightAnchor.constraint(equalToConstant: 50),
            
            separator.heightAnchor.constraint(equalToConstant: 1),
            
            passwordInput.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 0),
            passwordInput.leadingAnchor.constraint(equalTo: newStack.leadingAnchor, constant: 0),
            passwordInput.trailingAnchor.constraint(equalTo: newStack.trailingAnchor, constant: 0),
            passwordInput.heightAnchor.constraint(equalToConstant: 50),
        
        ])
        
        contentView.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordInput.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            /// Обязательно закрепиться к низу  contentView !!!!
            loginButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50)
        ])
        

    }
}

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
