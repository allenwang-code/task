//
//  MoneyTranferViewController.swift
//  Sync
//
//  Created by Allen Wang on 2018/9/9.
//  Copyright © 2018年 Allen Wang. All rights reserved.
//

import UIKit

class MoneyTranferViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var compareTransferBtn: UIButton!
//    @IBOutlet weak var advertBtn: UIButton!
//    @IBOutlet weak var advertBtn: UIButton!

    var adverts = [Advert]()
    var scrollY: CGFloat = 0
    var tabBarHiding = false
    var originContainerViewHeight:CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        originContainerViewHeight = tableView.frame.height
        getData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    fileprivate func getData() {
        // replace with server data
        let advert1 = Advert(imgageUrl: #imageLiteral(resourceName: "market_picture_1"), action: "redirect")
        let advert2 = Advert(imgageUrl: #imageLiteral(resourceName: "market_pucture_2"), action: "redirect")
        adverts.append(advert1)
        adverts.append(advert2)
        adverts.append(advert1)
        adverts.append(advert2)
        adverts.append(advert1)
        adverts.append(advert2)
        
        tableView.reloadData()
    }
    
    
}
