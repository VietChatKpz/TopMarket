//
//  AlertHelper.swift
//  TopsMarket
//
//  Created by Nguyễn Đình Việt on 04/04/2022.
//

import UIKit

class AlertHelper {
    class func showAlert(message: String, viewController: UIViewController) {
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        let alertController = UIAlertController(title: "Thông Báo", message: message, preferredStyle: .alert)
        
        alertController.addAction(alertAction)
        viewController.present(alertController, animated: true)
    }
}
