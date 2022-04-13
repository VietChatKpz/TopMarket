//
//  NotifyViewController.swift
//  TopsMarket
//
//  Created by Nguyễn Đình Việt on 27/02/2022.
//

import UIKit
import ToastViewSwift

class NotifyViewController: UIViewController {

    @IBOutlet weak var guiButton: UIButton!
    @IBOutlet weak var goiButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var noiDungTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
    }

    func setUp() {
        guiButton.layer.cornerRadius = 8
        goiButton.layer.cornerRadius = 8
    }

    @IBAction func actionGui(_ sender: Any) {
        if (emailTextField.text == "" || noiDungTextField.text == "") {
            let toast = Toast.text("Không được để trống")
            toast.show()
        }else {
            let toast = Toast.default(
                image: UIImage(systemName: "paperplane.circle.fill")!,
                title: "Thư đã gửi",
                subtitle: "Thành công"
            )
            toast.show()
        }
        
    }
    @IBAction func actionGoi(_ sender: Any) {
        let alert = UIAlertController(title: "Gọi tổng đài", message: "Bạn có thể gọi chúng tôi để được hỗ trợ tốt nhất", preferredStyle: .actionSheet)

        alert.addAction(UIAlertAction(title: "Gọi 1900 2602", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Huỷ", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func backAction(_ sender: Any) {
        dismiss(animated: true)
    }
}
