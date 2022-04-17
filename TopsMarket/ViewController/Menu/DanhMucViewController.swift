//
//  DanhMucViewController.swift
//  TopsMarket
//
//  Created by Nguyễn Đình Việt on 25/03/2022.
//

import UIKit

class DanhMucViewController: UIViewController {

    @IBOutlet weak var danhMucCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        danhMucCollectionView.delegate = self
        danhMucCollectionView.dataSource = self
        danhMucCollectionView.register(UINib(nibName: "FirstCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "dMucCell")
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    @IBAction func backAction(_ sender: Any) {
        dismiss(animated: true)
    }
    @IBAction func timKiemAction(_ sender: Any) {
        let vc = TimKiemViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}

extension DanhMucViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrDM.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = danhMucCollectionView.dequeueReusableCell(withReuseIdentifier: "dMucCell", for: indexPath) as! FirstCollectionViewCell
        cell.setUp(with: arrDM[indexPath.row])
        return cell
    }
}

extension DanhMucViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 96, height: 88)
    }
}
