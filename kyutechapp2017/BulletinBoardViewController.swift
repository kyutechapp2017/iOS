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
        let gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        
        let color_1 = UIColor(red: 1.0, green: 0.7, blue: 0.7, alpha: 1.0).cgColor
        let color_2 = UIColor(red: 0.7, green: 1.0, blue: 0.7, alpha: 1.0).cgColor
        let color_3 = UIColor(red: 0.7, green: 0.7, blue: 1.0, alpha: 1.0).cgColor
        gradient.colors = [color_1, color_2, color_3]
        
        let position_1 = NSNumber(value: 0.0 as Float)
        let position_2 = NSNumber(value: 0.5 as Float)
        let position_3 = NSNumber(value: 1.0 as Float)
        
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.locations = [position_1, position_2, position_3]
//        classesButton.layer.insertSublayer(gradient, at:0)
        self.view.layer.insertSublayer(gradient, at: 0)
//        setBackView(Button: classesButton)
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
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x: 1.0, y: 0.8)
//        Button.layer.addSublayer(layer)
        Button.layer.insertSublayer(layer, at: 0)
        
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


