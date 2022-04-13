//
//  YeuThichViewController.swift
//  TopsMarket
//
//  Created by Nguyễn Đình Việt on 30/03/2022.
//

import UIKit

class YeuThichViewController: UIViewController {

    @IBOutlet weak var danhSachButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        danhSachButton.layer.borderWidth = 1.0
        danhSachButton.layer.borderColor = UIColor(red: 0.25, green: 0.57, blue: 0.30, alpha: 1.00).cgColor
        
    }

    @IBAction func dsachAction(_ sender: Any) {
        let vc = DanhSachViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }

}
