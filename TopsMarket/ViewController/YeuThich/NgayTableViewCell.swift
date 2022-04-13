//
//  NgayTableViewCell.swift
//  TopsMarket
//
//  Created by Nguyễn Đình Việt on 13/04/2022.
//

import UIKit

class NgayTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configCell(name: String){
        nameLabel.text = name
    }
}
