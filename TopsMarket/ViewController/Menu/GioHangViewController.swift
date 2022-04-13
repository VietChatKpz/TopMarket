//
//  GioHangViewController.swift
//  TopsMarket
//
//  Created by Nguyễn Đình Việt on 30/03/2022.
//

import UIKit

class GioHangViewController: UIViewController {

    @IBOutlet weak var gioHangCollectionVIew: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        gioHangCollectionVIew.delegate = self
        gioHangCollectionVIew.dataSource = self
        gioHangCollectionVIew.register(UINib(nibName: "ThirdCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GioCell")
        
    }

    @IBAction func maAction(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.bigc.vn/khuyen-mai.html")! as URL, options: [:], completionHandler: nil)
    }
}

extension GioHangViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrSP.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = gioHangCollectionVIew.dequeueReusableCell(withReuseIdentifier: "GioCell", for: indexPath) as! ThirdCollectionViewCell
        cell.setUpSP(with: arrSP[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sanPhamCV = SanPhamViewController()
        sanPhamCV.imgText = arrSP[indexPath.row].image
        sanPhamCV.nameText = arrSP[indexPath.row].nameSP
        sanPhamCV.priceText = arrSP[indexPath.row].priceSP
        sanPhamCV.thuongHieuText = arrSP[indexPath.row].thuongHieu
        sanPhamCV.nguonText = arrSP[indexPath.row].nguonGoc
        self.navigationController?.pushViewController(sanPhamCV, animated: true)
    }
}

extension GioHangViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 208, height: 268)
    }
}
