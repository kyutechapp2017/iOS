//
//  BulletinBoardViewController.swift
//  kyutechapp2017
//
//  Created by 山浦功 on 2017/02/19.
//  Copyright © 2017年 塩田宰. All rights reserved.
//

import UIKit

class BulletinBoardViewController: UIViewController {
    
    @IBOutlet weak var classesButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackView(Button: classesButton)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setBackView(Button: UIButton){
        let layer = CAGradientLayer()
        let startColor = UIColor(red: 129, green: 171, blue: 115, alpha: 1)
        let endColor = UIColor(red: 103, green: 179, blue: 126, alpha: 1)
        layer.colors = [startColor, endColor]
        layer.frame = Button.bounds
        //        Button.layer.insertSublayer(layer, at: 0)
        Button.layer.addSublayer(layer)
    }
    
}


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


