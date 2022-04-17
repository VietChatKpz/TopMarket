//
//  ConversationsViewController.swift
//  TopsMarket
//
//  Created by Nguyễn Đình Việt on 14/04/2022.
//

import UIKit
import FirebaseAuth

class ConversationsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
//        DatabaseManager.shared.test()
        
    }
    
    //Hàm sẽ được gọi khi một view đã được thêm vài hệ thống view và đã hiển thị lên màn hình
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        validateAuth()
    }
    
    private func validateAuth() {
        if FirebaseAuth.Auth.auth().currentUser == nil {
            let vc = LogInViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: false)
        }
    }
}

