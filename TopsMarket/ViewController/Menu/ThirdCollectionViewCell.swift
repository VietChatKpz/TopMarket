//
//  ThirdCollectionViewCell.swift
//  TopsMarket
//
//  Created by Nguyễn Đình Việt on 03/04/2022.
//

import UIKit
import ToastViewSwift

class ThirdCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var thirtView: UIView!
    @IBOutlet weak var thirdImageView: UIImageView!
    @IBOutlet weak var thirtNameLabel: UILabel!
    @IBOutlet weak var thirtPriceLabel: UILabel!
    @IBOutlet weak var timButton: UIButton!
    @IBOutlet weak var gioButton: UIButton!
    
    var isState: Bool = false
    var arrName = [String]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        thirtView.backgroundColor = UIColor(red: 0.94, green: 0.93, blue: 0.93, alpha: 1.00)
        gioButton.layer.borderWidth = 1.0
        gioButton.layer.borderColor = UIColor(red: 0.25, green: 0.57, blue: 0.30, alpha: 1.00).cgColor
        isState = true
        timButton.tintColor = UIColor(red: 0.25, green: 0.57, blue: 0.30, alpha: 1.00)
        
    }
    
    func setUpSP(with sanPham: SanPham){
        thirdImageView?.image = UIImage(named: sanPham.image)
        thirtNameLabel.text = sanPham.nameSP
        thirtPriceLabel.text = sanPham.priceSP
    }
    
    @IBAction func timAction(_ sender: Any) {
        if isState{
            timButton.tintColor = .red
//            arrName.append(thirtNameLabel?.text ?? "")
//            arrName += [thirtNameLabel?.text ?? ""]
//            for i in arrName {
//                print(i)
//            }
        }else{
            timButton.tintColor = UIColor(red: 0.25, green: 0.57, blue: 0.30, alpha: 1.00)
        }
        isState = !isState
    }
    
}
