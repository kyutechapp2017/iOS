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
    @IBOutlet weak var intensiveButton: UIButton!
    @IBOutlet weak var newsButton: UIButton!
    @IBOutlet weak var procedureButton: UIButton!
    @IBOutlet weak var departmentButton: UIButton!
    @IBOutlet weak var summonButton: UIButton!
    @IBOutlet weak var studyAbroadButton: UIButton!
    @IBOutlet weak var scholarshipButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor(sender: classesButton)
        setBackgroundColor(sender: intensiveButton)
        setBackgroundColor(sender: newsButton)
        setBackgroundColor(sender: procedureButton)
        setBackgroundColor(sender: departmentButton)
        setBackgroundColor(sender: summonButton)
        setBackgroundColor(sender: studyAbroadButton)
        setBackgroundColor(sender: scholarshipButton)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setBackgroundColor(sender: UIButton){
        let gradient = CAGradientLayer()
        let position_1 = NSNumber(value: 0.0 as Float)
        let position_2 = NSNumber(value: 1.0 as Float)
        var button = CategoryButton()
        button.setting(button: sender)
        gradient.colors = [button.color1.cgColor,button.color2.cgColor]
        gradient.startPoint = button.startPoint
        gradient.endPoint = button.endPoint
        gradient.frame = sender.bounds
        gradient.locations = [position_1, position_2]
        sender.layer.insertSublayer(gradient, at:0)
    }
}
