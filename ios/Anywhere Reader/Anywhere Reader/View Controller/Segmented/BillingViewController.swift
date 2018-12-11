//
//  BillingViewController.swift
//  Anywhere Reader
//
//  Created by Conner on 11/7/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit

class BillingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let insets = UIEdgeInsets(top: 10.0, left: 20.0, bottom: 10.0, right: 20.0)
        oneYearButton.titleEdgeInsets = insets
        fiveYearButton.titleEdgeInsets = insets
        oneYearButton.titleLabel?.textAlignment = .center
        fiveYearButton.titleLabel?.textAlignment = .center
    }
    
    @IBOutlet weak var oneYearButton: UIButton!
    @IBOutlet weak var fiveYearButton: UIButton!

}