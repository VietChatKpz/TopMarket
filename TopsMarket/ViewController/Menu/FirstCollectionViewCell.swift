//
//  FirstCollectionViewCell.swift
//  TopsMarket
//
//  Created by Nguyễn Đình Việt on 30/03/2022.
//

import UIKit

class FirstCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var firstView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        firstImageView.clipsToBounds = true
        firstView.layer.borderWidth = 1.0
        firstView.layer.borderColor = UIColor(red: 0.25, green: 0.57, blue: 0.30, alpha: 1.00).cgColor
    }

    func setUp(with danhMuc: DanhMuc){
        firstImageView?.image = UIImage(named: danhMuc.image)
        firstNameLabel.text = danhMuc.name
    }
}
