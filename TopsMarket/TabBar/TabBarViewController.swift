//
//  TabBarViewController.swift
//  TopsMarket
//
//  Created by Nguyễn Đình Việt on 30/03/2022.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.tintColor = UIColor(red: 0.25, green: 0.57, blue: 0.26, alpha: 1.00)
//        self.tabBar.barTintColor = .black
        self.tabBar.isTranslucent = false
        UITabBar.appearance().backgroundColor = UIColor.white
        
        
        let menuVC = MenuViewController()
        menuVC.tabBarItem = UITabBarItem(title: "Trang chủ", image: UIImage(named: "home1"), tag: 0)
        
        let danhMucVC = DanhMucViewController()
        danhMucVC.tabBarItem = UITabBarItem(title: "Danh Mục", image: UIImage(named: "square1"), selectedImage: UIImage(named: "square2"))
        
        let gioHangVC = GioHangViewController()
        gioHangVC.tabBarItem = UITabBarItem(title: "Giỏ Hàng", image: UIImage(named: "tote1"), selectedImage: UIImage(named: "tote1"))
        
        let yeuVC = YeuThichViewController()
        yeuVC.tabBarItem = UITabBarItem(title: "Yêu Thích", image: UIImage(named: "heart1"), selectedImage: UIImage(named: "heart2"))
        
        let personVC = PersonViewController()
        personVC.tabBarItem = UITabBarItem(title: "Cá Nhân", image: UIImage(named: "user1"), selectedImage: UIImage(named: "user1"))
        
        self.viewControllers = [menuVC, danhMucVC, gioHangVC, yeuVC, personVC]
    }
}
