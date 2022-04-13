//
//  AddressViewController.swift
//  TopsMarket
//
//  Created by Nguyễn Đình Việt on 27/02/2022.
//

import UIKit
import ToastViewSwift

class AddressViewController: UIViewController {

    public var complection1: ((String?) -> Void)?
    
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var cityButton: UIButton!
    @IBOutlet weak var districtButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUp()
    }

    func setUp() {
        cityButton.layer.borderWidth = 1.0
        cityButton.layer.borderColor = UIColor.brown.cgColor
        districtButton.layer.borderWidth = 1.0
        districtButton.layer.borderColor = UIColor.brown.cgColor
    }

    @IBAction func cityAction(_ sender: Any) {
        let cityText = CityViewController()
        cityText.complection = { [weak self] text in
            DispatchQueue.main.async {
                self?.cityButton.setTitle(text, for: .normal)
                if text == "Thành Phố Hồ Chí Minh"{
                    self?.districtButton.setTitle("Chọn quận", for: .normal)
                }else{
                    self?.districtButton.setTitle("Huyện Thanh Oai", for: .normal)
                }
            }
        }
        
        let vc = UINavigationController(rootViewController: cityText)
        vc.modalPresentationStyle = .pageSheet
        present(vc, animated: true, completion: nil)
    }
    @IBAction func districtAction(_ sender: Any) {
        let districtText = DistrictViewController()
        districtText.text = cityButton.titleLabel?.text
        
        districtText.complection = { [weak self] text in
            DispatchQueue.main.async {
                self?.districtButton.setTitle(text, for: .normal)
            }
        }
        let vc = UINavigationController(rootViewController: districtText)
        vc.modalPresentationStyle = .pageSheet
        present(vc, animated: true, completion: nil)
    }
    @IBAction func okAction(_ sender: Any) {
        if districtButton.titleLabel?.text == "Chọn quận" {
            let toast = Toast.text("Bạn chưa chọn quận")
            toast.show()
        }else{
            complection1?(districtButton.titleLabel?.text)
            dismiss(animated: true, completion: nil)
        }
    }
}
