//
//  CityViewController.swift
//  TopsMarket
//
//  Created by Nguyễn Đình Việt on 24/03/2022.
//

import UIKit

class CityViewController: UIViewController {

    public var complection: ((String?) -> Void)?
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var data = ["Thành Phố Hồ Chí Minh","Thành Phố Hà Nội"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "CityTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }

}

extension CityViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CityTableViewCell
        cell.configCell(name: data[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        complection?(data[indexPath.row])
        dismiss(animated: true)
    }
}
