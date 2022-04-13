//
//  RegisterViewController.swift
//  TopsMarket
//
//  Created by Nguyễn Đình Việt on 25/03/2022.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passworkTextField: UITextField!
    @IBOutlet weak var logoView: UIView!
    @IBOutlet weak var registerButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
    }

    func setUp(){
        logoView.layer.cornerRadius = 60
        emailTextField.layer.cornerRadius = 8
        passworkTextField.layer.cornerRadius = 8
        registerButton.layer.cornerRadius = 8
    }
    
    @IBAction func registerAction(_ sender: Any) {
        guard let mail = emailTextField.text, let password = passworkTextField.text else {
            return
        }
        
        FirebaseAuthManager.shared.register(mail: mail, pass: password) { [weak self] status, data in
            guard let strongSelf = self else { return }
            if status {
                
            }else {
                if let messageError = data {
                    AlertHelper.showAlert(message: messageError, viewController: strongSelf)
                } else {
                    AlertHelper.showAlert(message: "Đã xảy ra lỗi", viewController: strongSelf)
                }
            }
        }
    }
    
    @IBAction func loginAction(_ sender: Any) {
        dismiss(animated: true)
    }
}
