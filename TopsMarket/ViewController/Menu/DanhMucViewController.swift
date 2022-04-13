//
//  DanhMucViewController.swift
//  TopsMarket
//
//  Created by Nguyễn Đình Việt on 25/03/2022.
//

import UIKit

class DanhMucViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
