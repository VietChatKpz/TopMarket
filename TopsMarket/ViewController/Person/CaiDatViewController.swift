//
//  CaiDatViewController.swift
//  TopsMarket
//
//  Created by Nguyễn Đình Việt on 12/04/2022.
//

import UIKit
import ToastViewSwift

class CaiDatViewController: UIViewController {

    public var complection: ((String?) -> Void)?
    
    @IBOutlet weak var nSinhTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var gtinhTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var diaChiTextField: UITextField!
    
    let datePicker = UIDatePicker()
    var imgText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createDatePicker()
        
    }
    
    @IBAction func backAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func capNhatAction(_ sender: Any) {
        if nameTextField.text != "" && gtinhTextField.text != "" && emailTextField.text != "" && diaChiTextField.text != "" {
            complection?(nameTextField.text)
            dismiss(animated: true)
        }else {
            let toast = Toast.text("Bạn chưa nhập đầy đủ thông tin ")
            toast.show()
        }
        
    }
    
    func createDatePicker(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePresed))
        toolbar.setItems([doneBtn], animated: true)
        
        nSinhTextField.inputAccessoryView = toolbar
        
        nSinhTextField.inputView = datePicker
        datePicker.datePickerMode = .date
    }
    
    @objc func donePresed(){
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        nSinhTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }

}
