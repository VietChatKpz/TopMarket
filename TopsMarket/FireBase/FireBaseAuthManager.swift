//
//  FireBaseAuthManager.swift
//  TopsMarket
//
//  Created by Nguyễn Đình Việt on 03/04/2022.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

final class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    
}

// MARK: - Account Management

extension DatabaseManager{
    
    public func userExists(with email: String, completion: @escaping ((Bool) -> Void)) {
        
        var sefeEmail = email.replacingOccurrences(of: ".", with: "-")
        sefeEmail = sefeEmail.replacingOccurrences(of: "@", with: "-")
        
        database.child(sefeEmail).observeSingleEvent(of: .value, with: { snapshot in
            guard snapshot.value as? String != nil else {
                completion(false)
                return
            }
            
            completion(true)
        })
        
    }
    
    
    /// Inserts new user to database
    public func insertUser(with user: TopsMarket) {
        database.child(user.safeEmail).setValue([
            "first_name": user.firstName,
            "last_name": user.lastName
        ])
    }
}

struct TopsMarket {
    let firstName: String
    let lastName: String
    let emailAddress: String
    
    var safeEmail: String {
        var sefeEmail = emailAddress.replacingOccurrences(of: ".", with: "-")
        sefeEmail = sefeEmail.replacingOccurrences(of: "@", with: "-")
        return sefeEmail
    }
    //    let profilePictureUrl: String
}
