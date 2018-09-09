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
    
    fileprivate func hideHeader(_ tabViewController: MarketTabViewController, isVisible: Bool) {
        if !isVisible {
            tabViewController.marketLabel.isHidden = true
            tabViewController.HeaderView.frame = CGRect(x:0,
                                                    y: -55,
                                                    width: tabViewController.HeaderView.frame.size.width,
                                                    height: tabViewController.HeaderView.frame.size.height)
            tabViewController.containerView.frame = CGRect(x:0,
                                                       y: 65,
                                                       width: tabViewController.containerView.frame.size.width,
                                                       height: getScreenSize().height - 65)
        } else{
            tabViewController.marketLabel.isHidden = false
            tabViewController.HeaderView.frame = CGRect(x:0,
                                                        y: 0,
                                                        width: tabViewController.HeaderView.frame.size.width,
                                                        height: tabViewController.HeaderView.frame.size.height)
            tabViewController.containerView.frame = CGRect(x:0,
                                                           y: 130,
                                                           width: tabViewController.containerView.frame.size.width,
                                                           height:originContainerViewHeight-130)
    
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let tabViewController = self.tabBarController!.customizableViewControllers![2] as! MarketTabViewController
        tabViewController.searchView.resignFirstResponder()

        
        //setHeaderVisible(view: tabViewController.HeaderView,
        //                 visible: !isScrollingDown,
        //                duration: 0.3,
        //                animated: true)
        
        let isScrollingDown = scrollView.contentOffset.y > scrollY
        
        hideHeader(tabViewController, isVisible: !isScrollingDown)
        
        //???
        
        
        self.tabBarController?.setTabBarVisible(visible: !isScrollingDown, duration: 0.25, animated: true)
       
        scrollY = scrollView.contentOffset.y
    }
    
    func setHeaderVisible(view: UIView, visible:Bool, duration: TimeInterval, animated:Bool) {
        let isViewVisible = view.frame.origin.y < UIScreen.main.bounds.height
        if isViewVisible == visible { return }
        let frame = view.frame
        let height = frame.size.height
        let offsetY = (visible ? -height : height)
        
        // animation
        UIViewPropertyAnimator(duration: duration, curve: .linear) {
            view.frame.offsetBy(dx:0, dy:offsetY)
            self.view.frame = CGRect(x:0,y:0,width: self.view.frame.width, height: self.view.frame.height + offsetY)
            self.view.setNeedsDisplay()
            self.view.layoutIfNeeded()
            }.startAnimation()
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
