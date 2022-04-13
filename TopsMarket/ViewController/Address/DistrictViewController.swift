//
//  DistrictViewController.swift
//  TopsMarket
//
//  Created by Nguyễn Đình Việt on 24/03/2022.
//

import UIKit

class DistrictViewController: UIViewController {
    
    var text: String?
    
    public var complection: ((String?) -> Void)?
    
    @IBOutlet weak var tableView: UITableView!
    
    var hoCM = ["Quận 1","Quận 2 - Tp Thủ Đức","Quận 3","Quận 4","Quận 5","Quận 6","Quận 7","Quận 8","Quận 9 - Tp Thủ Đức","Quận 10","Quận 11","Quận 12","Huyện Bình Chánh","Quận Bình Tân","Quận Bình Thạch","Quận Gò Vấp","Huyện Hóc Môn","Quận Phú Nhuận","Quận Tân Bình","Quận Tân Phú","Quận Thủ Đức - Tp Thủ Đức"]
    var haN = ["Huyện Đan Phượng","Quận Bắc Từ Liêm","Huyện Thường Tín","Quận Long Biên","Huyện Chương Mỹ","Huyện Hoài Đức","Quận Ba Đình","Quận Cầu Giấy","Quận Đống Đa","Quận Hà Đông","Quận Hai Bà Trưng","Quận Hoàng Mai","Quận Hoàng Kiếm","Quận Nam Từ Liêm","Quận Tây Hồ","Huyện Thanh Oai","Huyện Thanh Trì","Quận Thanh Xuân"]
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "DistrictTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
    }

}

extension DistrictViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var number: Int!
        if text == "Thành Phố Hà Nội" {
            number = haN.count
        }else {
            number = hoCM.count
        }
        return number
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DistrictTableViewCell
        if text == "Thành Phố Hà Nội" {
            cell.configCell(name: haN[indexPath.row])
        }else{
            cell.configCell(name: hoCM[indexPath.row])
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if text == "Thành Phố Hà Nội" {
            complection?(haN[indexPath.row])
        }else{
            complection?(hoCM[indexPath.row])
        }
        dismiss(animated: true)
    }
}
