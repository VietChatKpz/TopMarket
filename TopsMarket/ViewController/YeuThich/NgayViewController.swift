//
//  NgayViewController.swift
//  TopsMarket
//
//  Created by Nguyễn Đình Việt on 13/04/2022.
//

import UIKit

class NgayViewController: UIViewController {

    public var complection: ((String?) -> Void)?
    @IBOutlet weak var tabelView: UITableView!
    
    var data = ["Mỗi ngày","Mỗi tuần","Mỗi tháng","Mỗi năm"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tabelView.dataSource = self
        tabelView.delegate = self
        tabelView.register(UINib(nibName: "NgayTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }

}

extension NgayViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NgayTableViewCell
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
