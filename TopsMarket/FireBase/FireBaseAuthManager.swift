//
//  FireBaseAuthManager.swift
//  TopsMarket
//
//  Created by Nguyễn Đình Việt on 03/04/2022.
//

import Foundation
import FirebaseAuth

class FirebaseAuthManager {
    static let shared = FirebaseAuthManager()
    
    func login(mail email: String, pass password: String, completion completionBlock: @escaping ((_ success: Bool, _ data: String?) -> Void)) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                completionBlock(false, "\(error.localizedDescription)")
            } else {
                if let user = result?.user {
                    completionBlock(true, "\(user.uid)")
                }
            }
        }
    }
    
    func register(mail email: String, pass password: String, completion completionBlock: @escaping ((_ success: Bool, _ data: String?) -> Void)) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                completionBlock(false, "\(error.localizedDescription)")
            } else {
                if let user = result?.user {
                    completionBlock(true, "\(user.uid)")
                }
            }
        }
    }
    
    func logOut(completion complectionBlock: @escaping ((_ success: Bool) -> Void)){
        do {
            try Auth.auth().signOut()
            complectionBlock(true)
        }catch {
            print("Error Logout", error.localizedDescription)
            complectionBlock(false)
        }
    }
    
}
