//
//  TTDatHangViewController.swift
//  TopsMarket
//
//  Created by Nguyễn Đình Việt on 13/05/2022.
//

import UIKit
import ToastViewSwift

class TTDatHangViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var tPTextField: UITextField!
    @IBOutlet weak var diachiTextField: UITextField!
    @IBOutlet weak var ghiTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func backAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func datHangAction(_ sender: Any) {
        if nameTextField.text == "" || tPTextField.text == "" || diachiTextField.text == "" {
            let toast = Toast.text("Không được để trống")
            toast.show()
        }else {
            let toast = Toast.text("Đặt hàng thành công")
            toast.show()
            dismiss(animated: true)
        }
    }
    
}
