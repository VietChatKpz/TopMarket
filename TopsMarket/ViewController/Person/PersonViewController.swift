//
//  PersonViewController.swift
//  TopsMarket
//
//  Created by Nguyễn Đình Việt on 25/03/2022.
//

import UIKit

class PersonViewController: UIViewController {
    
    @IBOutlet weak var perImageView: UIImageView!
    @IBOutlet weak var namePerson: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func dangXuatAction(_ sender: Any) {
        FirebaseAuthManager.shared.logOut { [weak self] status in
            guard let strongSelf = self else { return }
            
            if status {
                strongSelf.dismiss(animated: true, completion: nil)
//                print("Dang xuat")
            }else{
                let message = "Dang xuat that bai"
                AlertHelper.showAlert(message: message, viewController: strongSelf)
            }
        }
    }
    @IBAction func caiDatAction(_ sender: Any) {
        let caiDatText = CaiDatViewController()
        
        caiDatText.complection = { [weak self] text in
            DispatchQueue.main.async {
                self?.namePerson.text = text
            }
        }
        let vc = UINavigationController(rootViewController: caiDatText)
        
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        
    }
    @IBAction func hotlineAction(_ sender: Any) {
        let alert = UIAlertController(title: "Liên hệ", message: "Liên hệ ngay khi bạn muốn thắc mắc", preferredStyle: .actionSheet)
        
        let alertHotline = UIAlertAction(title: "1900 2602", style: .default)
        let alertCancel = UIAlertAction(title: "Huỷ", style: .cancel)
        
        alert.addAction(alertHotline)
        alert.addAction(alertCancel)
        
        present(alert, animated: true)
    }
    @IBAction func action1(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://topsmarket.vn")! as URL, options: [:], completionHandler: nil)
    }
    @IBAction func action2(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://topsmarket.vn")! as URL, options: [:], completionHandler: nil)
    }
    @IBAction func action3(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://topsmarket.vn")! as URL, options: [:], completionHandler: nil)
    }
    @IBAction func action4(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://topsmarket.vn")! as URL, options: [:], completionHandler: nil)
    }
}
