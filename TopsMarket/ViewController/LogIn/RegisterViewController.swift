//
//  RegisterViewController.swift
//  TopsMarket
//
//  Created by Nguyễn Đình Việt on 25/03/2022.
//

import UIKit
import FirebaseAuth
import ToastViewSwift

class RegisterViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
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
        self.passworkTextField.isSecureTextEntry = true

    }
    
    @IBAction func registerAction(_ sender: Any) {
        emailTextField.resignFirstResponder()
        passworkTextField.resignFirstResponder()
        firstNameTextField.resignFirstResponder()
        lastNameTextField.resignFirstResponder()
        
        guard let firstName = firstNameTextField.text, let lastName = lastNameTextField.text, let email = emailTextField.text, let password = passworkTextField.text, !firstName.isEmpty, !lastName.isEmpty, !email.isEmpty, !password.isEmpty, password.count >= 6 else{
            alertUserLoginError()
            return
        }
        
        //Fisebase Log In
        DatabaseManager.shared.userExists(with: email, completion: { [weak self] exists in
            guard let strongSelf = self else {
                return
            }
            guard !exists else {
                // user already exists
                strongSelf.alertUserLoginError(message: "Email đã tồn tại")
                return
            }
            FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: { authResult, error in
                
                let toast = Toast.text("Đăng kí thành công")
                toast.show()
                
                guard authResult != nil, error == nil else {
                    print("Error cureating user")
                    strongSelf.alertUserLoginError(message: "Email đã tồn tại")
                    return
                }
                
                DatabaseManager.shared.insertUser(with: TopsMarket(firstName: firstName, lastName: lastName, emailAddress: email))
                
                UserDefaults.standard.setValue(true, forKey: "login")
                let menuVC = TabBarViewController()
                let navigation = UINavigationController(rootViewController: menuVC)
                navigation.modalPresentationStyle = .overFullScreen
                strongSelf.present(navigation, animated: true)            })
        })
    }
    func alertUserLoginError(message: String = "Vui lòng nhập thông tin để tạo tài khoản mới"){
        let alert = UIAlertController(title: "Lỗi", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Huỷ bỏ", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    
    @IBAction func loginAction(_ sender: Any) {
        dismiss(animated: true)
    }
}

extension RegisterViewController: UITextFieldDelegate{

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        if textField == emailTextField {
            passworkTextField.becomeFirstResponder()
        }
        else if textField == passworkTextField {
            registerAction((Any).self)
        }

        return true
    }
}
