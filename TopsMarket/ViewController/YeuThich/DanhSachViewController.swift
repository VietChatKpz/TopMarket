//
//  DanhSachViewController.swift
//  TopsMarket
//
//  Created by Nguyễn Đình Việt on 13/04/2022.
//

import UIKit
import ToastViewSwift

class DanhSachViewController: UIViewController {

    @IBOutlet weak var ngayTextField: UITextField!
    @IBOutlet weak var danhMucTextField: UITextField!
    @IBOutlet weak var lapLaiButton: UIButton!
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lapLaiButton.layer.borderWidth = 1.0
        lapLaiButton.layer.borderColor = UIColor(red: 0.25, green: 0.57, blue: 0.30, alpha: 1.00).cgColor
        datePicker.preferredDatePickerStyle = UIDatePickerStyle.inline
        createDatePicker()
    }

    func createDatePicker(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePresed))
        toolbar.setItems([doneBtn], animated: true)
        
        ngayTextField.inputAccessoryView = toolbar
        
        ngayTextField.inputView = datePicker
        datePicker.datePickerMode = .date
    }
    
    @objc func donePresed(){
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        ngayTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @IBAction func ngayAction(_ sender: Any) {
        let ngayText = NgayViewController()
        ngayText.complection = { [weak self] text in
            DispatchQueue.main.async {
                self?.lapLaiButton.setTitle(text, for: .normal)
            }
        }
        
        let vc = UINavigationController(rootViewController: ngayText)
        vc.modalPresentationStyle = .pageSheet
        present(vc, animated: true, completion: nil)
    }
    @IBAction func backAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func taoMoiAction(_ sender: Any) {
        if danhMucTextField.text != "" {
            dismiss(animated: true)
        }
        else{
            let toast = Toast.text("Bạn chưa nhập tên danh mục")
            toast.show()
        }
    }
}
