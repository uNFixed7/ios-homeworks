

import UIKit

class LogInViewController: UIViewController {
    
    private lazy var loginText: String = loginInput.text ?? ""
    private lazy var passwordText: String = passwordInput.text ?? ""
    
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
        $0.placeholder = "Email or phone"
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: $0.frame.height))
        $0.leftViewMode = .always
        $0.autocapitalizationType = .none
        $0.delegate = self
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(loginTextChanged), for: .editingChanged)
        return $0
    }(UITextField())
    
    private let separator: UIView = {
            $0.frame = .zero
            $0.backgroundColor = .lightGray
            return $0
    }(UIView())
    
    private lazy var passwordInput: UITextField = {
        $0.placeholder = "Password"
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: $0.frame.height))
        $0.leftViewMode = .always
        $0.autocapitalizationType = .none
        $0.isSecureTextEntry = true
        $0.delegate = self
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(passwordTextChanged), for: .editingChanged)
        return $0
    }(UITextField())
    
    private let passwortCaption: UILabel = {
        $0.text = "Password is too short, it should be at least 6 character"
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .red
        $0.isHidden = true
        $0.font = UIFont.systemFont(ofSize: 10)
        return $0
    }(UILabel())
    
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
        $0.backgroundColor = .systemBackground
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
        
        if loginText == "" || passwordText.count < 6 {
            
            UIView.animate(
                withDuration: 0.5,
                delay: 0,
                usingSpringWithDamping: 0.1,
                initialSpringVelocity: 0.1,
                options: .curveEaseInOut) {
                    
                  /*  self.loginInput.attributedPlaceholder = NSAttributedString(
                        string: "Incorrect login",
                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.red]
                    )*/
                    
                    if self.loginText == "" {
                        self.loginInput.center.x += 2
                    }
                    
                    if self.passwordText == "" {
                        self.passwordInput.center.x += 2
                    }
                    
                    
                } completion: { _ in
                    UIView.animate(withDuration: 0.1,
                                   delay: 0) {
                        
                        if self.loginText == "" {
                            self.loginInput.center.x -= 2
                        }
                        
                        if self.passwordText == "" {
                            self.passwordInput.center.x -= 2
                        }
                    }
                }
            
            if passwordText != "" && passwordText.count < 6 {
                passwortCaption.isHidden = false
                
                _ = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(delayedTimer), userInfo: nil, repeats: false)
            }
    
            return
        }
        
        if loginText != "login" || passwordText != "password" {
            
            let alertCon = UIAlertController()
            alertCon.title = "Incorrect login or password"
            alertCon.message = "Please, chech login and password and try againg.\n Correct login is \"login\" and correct password is \"password\"."
           
            let alertRight = UIAlertAction(title: "Ok", style: .default)
            alertCon.addAction(alertRight)
            
            present(alertCon, animated: true)
        }
        
        
        if loginText == "login" && passwordText == "password" {
            navigationController?.pushViewController(profileViewController, animated: true)
        }
    }
    
    @objc private func delayedTimer() {
        passwortCaption.isHidden = true
    }
    
    @objc private func loginTextChanged(_ textField: UITextField) {
        loginText = textField.text!
    }
    
    @objc private func passwordTextChanged(_ textField: UITextField) {
        passwordText = textField.text!
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
        
        contentView.addSubview(passwortCaption)
        
        NSLayoutConstraint.activate([
        
            passwortCaption.topAnchor.constraint(equalTo: newStack.bottomAnchor, constant: 8),
            passwortCaption.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 26),
           // passwortCaption.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
           // passwortCaption.heightAnchor.constraint(equalToConstant: 10),
           // passwortCaption.widthAnchor.constraint(equalToConstant: 100)
        
        ])
        
        contentView.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: newStack.bottomAnchor, constant: 32),
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
