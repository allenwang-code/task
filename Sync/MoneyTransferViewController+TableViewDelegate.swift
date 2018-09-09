//
//  MoneyTransferViewController+TableViewDelegate.swift
//  Sync
//
//  Created by Allen Wang on 2018/9/9.
//  Copyright © 2018年 Allen Wang. All rights reserved.
//

import UIKit

extension MoneyTranferViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return adverts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let advert = adverts[row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "AdvertCell", for: indexPath) as! AdvertCell
        cell.advert = advert
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 410
    }
}

class AdvertCell: UITableViewCell {
    
    @IBOutlet weak var advertBtn: UIButton!
    
    var advert: Advert! {
        didSet {
            guard (self.advert) != nil else { return }
            
            self.advertBtn.setImage(advert.imgageUrl, for: .normal)
            self.advertBtn.layer.shadowOpacity = 0.5
            self.advertBtn.layer.shadowOffset = CGSize(width: 0, height: 0)
            self.advertBtn.layer.shadowRadius = 0
            self.advertBtn.layer.shadowColor = UIColor.darkGray.cgColor
        }
    }
    
    @IBAction func AdvertBtnDidClick(_ sender: UIButton) {
        print("AdvertBtnDidClick")
    }
    
}
