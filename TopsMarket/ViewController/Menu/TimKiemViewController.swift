//
//  TimKiemViewController.swift
//  TopsMarket
//
//  Created by Nguyễn Đình Việt on 08/04/2022.
//

import UIKit

class TimKiemViewController: UIViewController {
    
    var arrData = [SanPham]()

    @IBOutlet weak var timKiemCollection: UICollectionView!
    @IBOutlet weak var searchBarSP: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrData = arrSP
        
        searchBarSP.delegate = self
        timKiemCollection.delegate = self
        timKiemCollection.dataSource = self
        timKiemCollection.register(UINib(nibName: "ThirdCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TimCell")
        
    }

    @IBAction func backAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension TimKiemViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrSP.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = timKiemCollection.dequeueReusableCell(withReuseIdentifier: "TimCell", for: indexPath) as! ThirdCollectionViewCell
        cell.setUpSP(with: arrSP[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 208, height: 268)
    }

}

extension TimKiemViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.text?.isEmpty ?? true {
            arrData = arrSP
        }else {
            arrData = arrSP.filter({ item in
                item.nameSP.lowercased().contains(searchBar.text?.lowercased() ?? "")
            })
        }
        timKiemCollection.reloadData()
        view.endEditing(true)
    }
}
