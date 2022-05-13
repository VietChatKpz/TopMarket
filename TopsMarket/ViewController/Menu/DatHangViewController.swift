//
//  DatHangViewController.swift
//  TopsMarket
//
//  Created by Nguyễn Đình Việt on 11/05/2022.
//

import UIKit
import ToastViewSwift

class DatHangViewController: UIViewController {

    @IBOutlet weak var giaSPLabel: UILabel!
    @IBOutlet weak var tenSPLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var collectionVIew: UICollectionView!
    @IBOutlet weak var soLabel: UILabel!
    
    var image: String?
    var tenSP: String?
    var giaSP: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        imageView.image = UIImage(named: image ?? "")
//        tenSPLabel.text = tenSP ?? ""
//        giaSPLabel.text = giaSP ?? ""
        
        collectionVIew.dataSource = self
        collectionVIew.delegate = self
        collectionVIew.register(UINib(nibName: "ThirdCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "hangCell")
        
    }

    @IBAction func backAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func giamAction(_ sender: Any) {
        
    }
    
    @IBAction func tangAction(_ sender: Any) {
        
    }
    
    @IBAction func datHangAction(_ sender: Any) {
        let vc = TTDatHangViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
}

extension DatHangViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrSP.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionVIew.dequeueReusableCell(withReuseIdentifier: "hangCell", for: indexPath) as! ThirdCollectionViewCell
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

extension DatHangViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionVIew.frame.width/2-8, height: collectionVIew.frame.height/2-8)
    }
}
