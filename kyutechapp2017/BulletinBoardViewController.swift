
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
    
    @IBAction func goToDetail(segue: UIStoryboardSegue){}
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setButtonView(button: classesButton, type: .classes)
//        setButtonView(button: intensiveButton, type: .intensive)
//        setButtonView(button: newsButton, type: .news)
//        setButtonView(button: procedureButton, type: .procedure)
//        setButtonView(button: departmentButton, type: .department)
//        setButtonView(button: summonButton, type: .summon)
//        setButtonView(button: studyAbroadButton, type: .studyAbroad)
//        setButtonView(button: scholarshipButton, type: .scholarship)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
