//
//  MenuViewController.swift
//  TopsMarket
//
//  Created by Nguyễn Đình Việt on 27/02/2022.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var addressButton: UIButton!
    @IBOutlet weak var notifyButton: UIButton!
    @IBOutlet weak var firstCollectionView: UICollectionView!
    @IBOutlet weak var secondCollectionView: UICollectionView!
    @IBOutlet weak var thirtCollectionView: UICollectionView!
    @IBOutlet weak var sliderImage: UICollectionView!
    
//    var arrImg1 = [ UIImage(named: "panel1"),
//                    UIImage(named: "panel2"),
//                    UIImage(named: "panel3") ]
//
//    var timer = Timer()
//    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        DispatchQueue.main.async {
//            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
//        }
        setUp()
//        setUpSlider()
    }

    func setUp() {
        secondCollectionView.delegate = self
        secondCollectionView.dataSource = self
        secondCollectionView.register(UINib(nibName: "FirstCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FirstCell")
        
        thirtCollectionView.delegate = self
        thirtCollectionView.dataSource = self
        thirtCollectionView.register(UINib(nibName: "ThirdCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ThirtCell")
        
        sliderImage.delegate = self
        sliderImage.dataSource = self
        sliderImage.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCell")
        
    }
    
//    func setUpSlider() {
//        pageView.numberOfPages = arrImg1.count
//        pageView.currentPage = 0
//    }
//    
//    @objc func changeImage() {
//        if counter < arrImg1.count {
//            let index = IndexPath.init(item: counter, section: 0)
//            self.sliderImage.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
//            pageView.currentPage = counter
//            counter += 1
//        }else {
//            counter = 0
//            let index = IndexPath.init(item: counter, section: 0)
//            self.sliderImage.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
//            pageView.currentPage = counter
//        }
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
        @IBAction func addressAction(_ sender: Any) {
        let addressText = AddressViewController()
        
        addressText.complection1 = { [weak self] text in
            DispatchQueue.main.async {
                self?.addressLabel.text = text
            }
        }
        let vc = UINavigationController(rootViewController: addressText)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func notifyAction(_ sender: Any) {
        let vc = NotifyViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func danhMucAction(_ sender: Any) {
        let vc = DanhMucViewController()
        
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func personAction(_ sender: Any) {
        let vc = PersonViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    @IBAction func timKiemAction(_ sender: Any) {
        let vc = TimKiemViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}

extension MenuViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == secondCollectionView {
            return arrDM.count
        }else if collectionView == thirtCollectionView {
            return arrSP.count
        }
        else {
            return arrImg.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == secondCollectionView {
            let cell = secondCollectionView.dequeueReusableCell(withReuseIdentifier: "FirstCell", for: indexPath) as! FirstCollectionViewCell
            cell.setUp(with: arrDM[indexPath.row])
            return cell
        }else if collectionView == thirtCollectionView {
            let cell = thirtCollectionView.dequeueReusableCell(withReuseIdentifier: "ThirtCell", for: indexPath) as! ThirdCollectionViewCell
            cell.setUpSP(with: arrSP[indexPath.row])
            return cell
        }
        else {
            let cell = sliderImage.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCollectionViewCell
            cell.setUpImage(with: arrImg[indexPath.row])
//            cell.page.currentPage = indexPath.row
//            if let vc = cell.viewWithTag(111) as? UIImageView {
//                vc.image = arrImg1[indexPath.row]
//            } else if let ab = cell.viewWithTag(222) as? UIPageControl {
//                ab.currentPage = indexPath.row
//            }
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == secondCollectionView {
            let danhMucCV = DanhMucViewController()
            danhMucCV.modalPresentationStyle = .fullScreen
            present(danhMucCV, animated: true)
        }
        if collectionView == thirtCollectionView {
            let sanPhamCV = SanPhamViewController()
            sanPhamCV.imgText = arrSP[indexPath.row].image
            sanPhamCV.nameText = arrSP[indexPath.row].nameSP
            sanPhamCV.priceText = arrSP[indexPath.row].priceSP
            sanPhamCV.thuongHieuText = arrSP[indexPath.row].thuongHieu
            sanPhamCV.nguonText = arrSP[indexPath.row].nguonGoc
            self.navigationController?.pushViewController(sanPhamCV, animated: true)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}

extension MenuViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == secondCollectionView {
            return CGSize(width: 96, height: 96)
        }else if collectionView == thirtCollectionView {
            return CGSize(width: 208, height: 268)
        }
        else {
            return CGSize(width: 396, height: 108)
        }
    }
}

