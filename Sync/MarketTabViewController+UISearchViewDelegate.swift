//
//  MarketTabViewController+UISearchViewDelegate.swift
//  Sync
//
//  Created by Allen Wang on 2018/9/9.
//  Copyright © 2018年 Allen Wang. All rights reserved.
//

import UIKit

extension MarketTabViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.frame = CGRect(x:5, y:searchBar.frame.origin.y, width: self.getScreenSize().width-5, height: searchBar.frame.size.height)
        marketLabel.isHidden = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.frame = CGRect(x: self.getScreenSize().width - 50, y:searchBar.frame.origin.y, width: 45, height: searchBar.frame.size.height)
        searchBar.text = ""
        marketLabel.isHidden = false
    }
    
    
}
