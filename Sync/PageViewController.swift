//
//  PageViewController.swift
//  Sync
//
//  Created by Allen Wang on 2018/9/9.
//  Copyright © 2018年 Allen Wang. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {

    lazy var pages: [UIViewController] = {
        return [
            getMoneyTranferViewController(),
            self.getViewController(withIdentifier: "InsuranceViewController"),
            self.getViewController(withIdentifier: "CreditViewController"),
            self.getViewController(withIdentifier: "LoanViewController"),
        ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        
        if let firstVC = pages.first {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func getMoneyTranferViewController() -> MoneyTranferViewController
    {
        let vc =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MoneyTranferViewController") as! MoneyTranferViewController
       
        return vc
    }
    
    private func getViewController(withIdentifier identifier: String) -> UIViewController
    {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier)
    }
}
