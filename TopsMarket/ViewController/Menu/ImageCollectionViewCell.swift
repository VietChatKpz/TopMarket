//
//  ImageCollectionViewCell.swift
//  TopsMarket
//
//  Created by Nguyễn Đình Việt on 04/04/2022.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageMenuView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageMenuView.layer.cornerRadius = 16
    }

    func setUpImage(with sliders: Slider){
        imageMenuView?.image = UIImage(named: sliders.image)
    }
    
}
