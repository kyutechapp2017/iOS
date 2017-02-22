//
//  DetailPageViewController.swift
//  kyutechapp2017
//
//  Created by 塩田宰 on 2017/02/19.
//  Copyright © 2017年 塩田宰. All rights reserved.
//

import UIKit

class DetailPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // NavigationItem
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
