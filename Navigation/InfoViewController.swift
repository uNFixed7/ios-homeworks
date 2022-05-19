
import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        
        let buttonAlert = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        buttonAlert.setTitle("Alert", for: .normal)
        buttonAlert.addTarget(self, action: #selector(tapAlertAction), for: .touchUpInside)
        
        view.addSubview(buttonAlert)
    }
    

    @objc private func tapAlertAction() {
     
        let alertCon = UIAlertController()
        alertCon.title = "Alert title"
        alertCon.message = "Alert message"
        
        let alertLeft = UIAlertAction(title: "False", style: .destructive, handler: someHandler)
        let alertRight = UIAlertAction(title: "True", style: .default) { _ in print("true")}
        alertCon.addAction(alertLeft)
        alertCon.addAction(alertRight)
        
        present(alertCon, animated: true)
    }
    
    func someHandler(alert: UIAlertAction!){
        print("false")
    }
}
