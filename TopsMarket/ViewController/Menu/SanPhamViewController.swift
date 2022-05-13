//
//  SanPhamViewController.swift
//  TopsMarket
//
//  Created by Nguyễn Đình Việt on 08/04/2022.
//

import UIKit

class SanPhamViewController: UIViewController {

    var imgText: String?
    var nameText: String?
    var priceText: String?
    var thuongHieuText: String?
    var nguonText: String?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var thuongHieuLabel: UILabel!
    @IBOutlet weak var nguonLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = UIImage(named: imgText ?? "")
        nameLabel.text = nameText ?? ""
        priceLabel.text = priceText ?? ""
        thuongHieuLabel.text = thuongHieuText ?? ""
        nguonLabel.text = nguonText ?? ""
        
    }
    @IBAction func backAction(_ sender: Any) {
//        self.presentingViewController?.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func thongTinAction(_ sender: Any) {
        let vc = ThongTinViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    @IBAction func themGio(_ sender: Any) {
        let vc = ThemGioHangViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    @IBAction func datHangAction(_ sender: Any) {
        let vc = DatHangViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        
        
    }
}
