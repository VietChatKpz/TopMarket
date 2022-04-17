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
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nSinhTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var gtinhTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var diaChiTextField: UITextField!
    
    let datePicker = UIDatePicker()
    var imgText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.preferredDatePickerStyle = UIDatePickerStyle.inline
        createDatePicker()
        imageView.isUserInteractionEnabled = true
        imageView.layer.masksToBounds = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapChangePic))
        imageView.addGestureRecognizer(gesture)
        
    }
    
    @objc private func didTapChangePic() {
        presentPhotoActionSheet()
    }
    
    @IBAction func backAction(_ sender: Any) {
        dismiss(animated: true)
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

extension CaiDatViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func presentPhotoActionSheet(){
        let actionSheet = UIAlertController(title: "Thay đổi ảnh đại diện", message: "Bạn có muốn thay đổi ảnh hay không?", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Huỷ", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Lấy ảnh", style: .default, handler: { [weak self] _ in
            self?.presentCamera()
        }))
        actionSheet.addAction(UIAlertAction(title: "Chọn ảnh", style: .default, handler: { [weak self] _ in
            self?.presentPhotoPicker()
        }))
        present(actionSheet, animated: true)
    }
    
    func presentCamera() {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    func presentPhotoPicker() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        guard let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else { return }
        self.imageView.image = selectedImage
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
}
