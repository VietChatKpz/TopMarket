//
//  LogInViewController.swift
//  TopsMarket
//
//  Created by Nguyễn Đình Việt on 27/02/2022.
//

import UIKit
import ToastViewSwift

class LogInViewController: UIViewController {

    @IBOutlet weak var logoView: UIView!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        mailTextField.text = ""
        passTextField.text = ""
    }
    
    func setUp() {
        logoView.layer.cornerRadius = 60
        mailTextField.layer.cornerRadius = 8
        passTextField.layer.cornerRadius = 8
        logInButton.layer.cornerRadius = 8
        self.passTextField.isSecureTextEntry = true
    }
    
    @IBAction func logInAction(_ sender: Any) {
        guard let mail = mailTextField.text, let password = passTextField.text else {
            return
        }
        
        FirebaseAuthManager.shared.login(mail: mail, pass: password) { [weak self] status, data in
            guard let strongSelf = self else { return }
            if status {
                UserDefaults.standard.setValue(true, forKey: "login")
                
                let menuVC = TabBarViewController()
                let navigation = UINavigationController(rootViewController: menuVC)
                navigation.modalPresentationStyle = .overFullScreen
                strongSelf.present(navigation, animated: true)
                
            }else {
                UserDefaults.standard.setValue(false, forKey: "login")
                
                if let messageError = data {
                    AlertHelper.showAlert(message: messageError, viewController: strongSelf)
                } else {
                    AlertHelper.showAlert(message: "Đã xảy ra lỗi", viewController: strongSelf)
                }
            }
        }
//        if phoneTextField.text?.count != 0 && passTextField.text?.count != 0 {
//            let vc = TabBarViewController()
//            vc.modalPresentationStyle = .overFullScreen
//            present(vc, animated: true, completion: nil)
//        }else {
//            let alert = UIAlertController(title: "Error", message: "Nhập đầy đủ thông tin", preferredStyle: .alert)
//            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//            alert.addAction(okAction)
//            present(alert, animated: true, completion: nil)
//        }
    }
    @IBAction func registerAction(_ sender: Any) {
        let vc = RegisterViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}

