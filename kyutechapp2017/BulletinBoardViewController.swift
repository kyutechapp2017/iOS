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
        categoryButton(button: classesButton, color_start: .classesColor_1, color_end:.classesColor_2, start_x: 0.0, start_y: 0.0, end_x: 1.0, end_y: 1.0)
        categoryButton(button: intensiveButton, color_start: .intensiveColor_1, color_end: .intensiveColor_2, start_x: 1.0, start_y: 0.0, end_x: 0.0, end_y: 1.0)
        categoryButton(button: newsButton, color_start: .news_1, color_end: .news_2, start_x: 1.0, start_y: 0.0, end_x: 0.0, end_y: 1.0)
        categoryButton(button: procedureButton, color_start: .procedure_1, color_end: .procedure_2, start_x: 0.5, start_y: 0.0, end_x: 0.5, end_y:  1.0)
        categoryButton(button: departmentButton, color_start: .department_1, color_end: .department_2, start_x: 0.0, start_y: 0.0, end_x: 1.0, end_y: 1.0)
        categoryButton(button: summonButton, color_start: .summon_1, color_end: .summon_2, start_x: 1.0, start_y: 0.0, end_x: 0.0, end_y: 1.0)
        categoryButton(button: studyAbroadButton, color_start: .studyAbroad_1, color_end: .studyAbroad_2, start_x: 0.0, start_y: 0.0, end_x: 1.0, end_y: 1.0)
        categoryButton(button: scholarshipButton, color_start: .scholarship_1, color_end: .scholarship_2, start_x: 0.0, start_y: 0.0, end_x: 1.0, end_y: 1.0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func categoryButton(button: UIButton, color_start:UIColor, color_end:UIColor, start_x:CGFloat, start_y:CGFloat, end_x:CGFloat, end_y:CGFloat){
        let gradient = CAGradientLayer()
        let image = UIImage(named: "cl")
        let position_1 = NSNumber(value: 0.0 as Float)
        let position_2 = NSNumber(value: 1.0 as Float)
        let startPoint = CGPoint(x: start_x, y: start_y)
        let endPoint = CGPoint(x: end_x, y: end_y)
        gradient.colors = [color_start.cgColor,color_end.cgColor]
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        gradient.frame = button.bounds
        gradient.locations = [position_1, position_2]
        button.layer.insertSublayer(gradient, at: 0)
//        button.bringSubview(toFront: )
//        button.layer.sublayers
        button.imageView?.image = image
    }

}
