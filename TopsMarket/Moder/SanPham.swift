//
//  SanPham.swift
//  TopsMarket
//
//  Created by Nguyễn Đình Việt on 03/04/2022.
//

import Foundation
import UIKit

struct SanPham {
    var image = String()
    var nameSP = String()
    var priceSP = String()
    var thuongHieu = String()
    var nguonGoc = String()
}

let arrSP: [SanPham] = [
    SanPham(image: "banh", nameSP: "Bánh ChocoPie", priceSP: "45.000 đồng", thuongHieu: "Orion", nguonGoc: "Việt Nam"),
    SanPham(image: "botcanh", nameSP: "Bột Canh I-Ốt", priceSP: "4.000 đồng", thuongHieu: "Hải Châu", nguonGoc: "Việt Nam"),
    SanPham(image: "coca", nameSP: "Nước Ngọt CocaCola", priceSP: "8.000 đồng",thuongHieu: "Coca Cola", nguonGoc: "Việt Nam"),
    SanPham(image: "daugoi", nameSP: "Dầu Gội Dove", priceSP: "130.000 đồng",thuongHieu: "Dove", nguonGoc: "Việt Nam"),
    SanPham(image: "keo", nameSP: "Kẹp Alpenliebe", priceSP: "10.000 đồng",thuongHieu: "Alpenliebe", nguonGoc: "Việt Nam"),
    SanPham(image: "milo", nameSP: "Sữa Milo", priceSP: "27.000 đồng", thuongHieu: "Nestlé", nguonGoc: "Việt Nam"),
    SanPham(image: "mitom", nameSP: "Mì tôm Hảo Hảo", priceSP: "4.000 đồng",thuongHieu: "Hảo Hảo", nguonGoc: "Việt Nam"),
    SanPham(image: "nhan", nameSP: "Nhãn Phú Quốc", priceSP: "80.000 đồng",thuongHieu: "Tops", nguonGoc: "Việt Nam"),
    SanPham(image: "suaruamat", nameSP: "Sữa Rửa Mặt Corsx", priceSP: "300.000 đồng",thuongHieu: "Corsx", nguonGoc: "Hàn Quốc"),
    SanPham(image: "tuongot", nameSP: "Tưởng Ớt Chinsu", priceSP: "12.000 đồng",thuongHieu: "Chin Su", nguonGoc: "Việt Nam"),
    SanPham(image: "dauan", nameSP: "Dầu ăn Neptune Light 1L", priceSP: "60.000 đồng", thuongHieu: "Neptune", nguonGoc: "Việt Nam"),
    SanPham(image: "caphe", nameSP: "Cà Phê G7 hộp 18 gói", priceSP: "42.000 đồng", thuongHieu: "G7", nguonGoc: "Việt Nam"),
    SanPham(image: "banhdanisa", nameSP: "Bánh quy bơ Danisa", priceSP: "185.000 đồng", thuongHieu: "Danisa", nguonGoc: "Đan Mạch"),
    SanPham(image: "dam", nameSP: "Dấm Trung Thành", priceSP: "8.000 đồng", thuongHieu: "Trung Thành", nguonGoc: "Việt Nam"),
    SanPham(image: "thach", nameSP: "Thạch rau câu Long Hải", priceSP: "14.000 đồng", thuongHieu: "Long Hải", nguonGoc: "Việt Nam"),
    SanPham(image: "thuocla", nameSP: "Thuốc lá Thăng Long", priceSP: "10.000 đồng", thuongHieu: "Thăng Long", nguonGoc: "Việt Nam"),
    SanPham(image: "ruou", nameSP: "Rượu Chivas 38 năm", priceSP: "21.500.000 đồng", thuongHieu: "Chivas", nguonGoc: "Scotland"),
    SanPham(image: "yen", nameSP: "Yến Sào Khánh Hoà", priceSP: "200.000 đồng", thuongHieu: "Khánh Hoà", nguonGoc: "Việt Nam")
]

