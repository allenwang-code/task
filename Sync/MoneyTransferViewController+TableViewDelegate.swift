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
        return 400
    }
}

class AdvertCell: UITableViewCell {
    
    @IBOutlet weak var advertBtn: UIButton!
    
    var advert: Advert! {
    didSet {
        guard (self.advert) != nil else { return }
    self.advertBtn.setImage(advert.imgageUrl, for: .normal)
    }
    }
    
    @IBAction func AdvertBtnDidClick(_ sender: UIButton) {
        print("AdvertBtnDidClick")
    }
    
}
