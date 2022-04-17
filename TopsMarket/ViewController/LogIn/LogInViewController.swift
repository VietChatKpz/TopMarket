//
//  LogInViewController.swift
//  TopsMarket
//
//  Created by Nguyễn Đình Việt on 27/02/2022.
//

import UIKit
import FirebaseAuth
import ToastViewSwift
import FBSDKLoginKit
import GoogleSignIn

class LogInViewController: UIViewController {
    
    @IBOutlet weak var logoView: UIView!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var facebookButton: FBLoginButton!
    
    var googleSignIn = GIDSignIn.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passTextField.isSecureTextEntry = true
        mailTextField.delegate = self
        passTextField.delegate = self
        
        facebookButton.delegate = self
        //        facebookButton.permissions = ["email, public_profile"]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        mailTextField.text = ""
        passTextField.text = ""
    }
    
    func alertUserLoginError(){
        let alert = UIAlertController(title: "Lỗi", message: "Vui lòng nhập thông tin để đăng nhập", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Huỷ bỏ", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    
    @IBAction func forgotAction(_ sender: Any) {
        guard let email = mailTextField.text, !email.isEmpty else {
            
            let toast = Toast.text("Tên đăng nhập không được để trống")
            toast.show()
            return
            
        }
        
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if error != nil {
                let toast = Toast.text("Người dùng không hợp lệ hoặc đã bị xoá")
                toast.show()
            }else {
                let toast = Toast.text("Vui lòng kiểm tra email của bạn để thay đổi mật khẩu")
                toast.show()
            }
        }
    }
    
    @IBAction func googleSignInButton(_ sender: Any) {
//        self.googleAuthLogin()
    }
    
    func googleAuthLogin() {
        let googleConfig = GIDConfiguration(clientID: "CLIENT_ID")
        self.googleSignIn.signIn(with: googleConfig, presenting: self) { user, error in
            if error == nil {
                guard let user = user else {
                    print("Uh oh. The user cancelled the Google login.")
                    return
                }
                
                let userId = user.userID ?? ""
                print("Google User ID: \(userId)")
                
                let userIdToken = user.authentication.idToken ?? ""
                print("Google ID Token: \(userIdToken)")
                
                let userFirstName = user.profile?.givenName ?? ""
                print("Google User First Name: \(userFirstName)")
                
                let userLastName = user.profile?.familyName ?? ""
                print("Google User Last Name: \(userLastName)")
                
                let userEmail = user.profile?.email ?? ""
                print("Google User Email: \(userEmail)")
                
                let googleProfilePicURL = user.profile?.imageURL(withDimension: 150)?.absoluteString ?? ""
                print("Google Profile Avatar URL: \(googleProfilePicURL)")
                
            }
        }
    }
    
    @IBAction func logInAction(_ sender: Any) {
        
        mailTextField.resignFirstResponder()
        passTextField.resignFirstResponder()
        
        guard let email = mailTextField.text, let password = passTextField.text, !email.isEmpty, !password.isEmpty, password.count >= 6 else{
            alertUserLoginError()
            return
        }
        
        //Fisebase Log In
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: { [weak self] authResult, error in
            
            guard let strongSelf = self else {
                return
            }
            guard let result = authResult, error == nil else {
                let toast = Toast.text("Tài khoản hoặc mật khẩu không chính xác")
                toast.show()
                print("Failed to log in user with email: \(email)")
                return
            }
            let toast = Toast.text("Đăng nhập thành công")
            toast.show()
            
            let user = result.user
            print("Logged In User: \(user)")
            UserDefaults.standard.setValue(true, forKey: "login")
            let menuVC = TabBarViewController()
            let navigation = UINavigationController(rootViewController: menuVC)
            navigation.modalPresentationStyle = .overFullScreen
            strongSelf.present(navigation, animated: true)
        })
    }
    
    @IBAction func registerAction(_ sender: Any) {
        let vc = RegisterViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}

extension LogInViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == mailTextField {
            passTextField.becomeFirstResponder()
        }
        else if textField == passTextField {
            logInAction((Any).self)
        }
        
        return true
    }
}

extension LogInViewController: LoginButtonDelegate {
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        
    }
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        
        guard let token = result?.token?.tokenString else {
            return
        }
        let facebookRequest = FBSDKLoginKit.GraphRequest(graphPath: "me",
                                                         parameters: ["fields":
                                                                        "email, first_name, last_name"],
                                                         tokenString: token,
                                                         version: nil,
                                                         httpMethod: .get)
        
        facebookRequest.start { _, result, error in
            guard let result = result as? [String: Any],
                  error == nil else {
                print("Yêu cầu FB không thành công")
                return
            }
            
            print("\(result)")
            
            guard let firstName = result["first_name"] as? String,
                  let lastName = result["last_name"] as? String,
                  let email = result["email"] as? String
            else {
                print("Không thể lấy được email và tên từ FB")
                return
            }
            
            UserDefaults.standard.set(email, forKey: "email")
            UserDefaults.standard.set("\(firstName) \(lastName)", forKey: "name")
            
            let credential = FacebookAuthProvider.credential(withAccessToken: token)
            FirebaseAuth.Auth.auth().signIn(with: credential, completion: { [weak self] authResult, error in
                guard let strongSelf = self else {
                    return
                }
                
                guard authResult != nil, error == nil else {
                    if let error = error {
                        print("Đăng nhập không thành công có thể cần MFA - \(error)")
                    }
                    return
                }
                
                print("Đăng nhập thành công")
                strongSelf.navigationController?.dismiss(animated: true, completion: nil)
            })
        }
    }
}
