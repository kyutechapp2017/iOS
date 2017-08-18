
//  BulletinBoardViewController.swift
//  kyutechapp2017
//
//  Created by 山浦功 on 2017/02/19.
//  Copyright © 2017年 塩田宰. All rights reserved.
//

import UIKit

class BulletinBoardViewController: UIViewController {
    
    //未使用
    @IBOutlet weak var classesButton: UIButton!
    @IBOutlet weak var intensiveButton: UIButton!
    @IBOutlet weak var newsButton: UIButton!
    @IBOutlet weak var procedureButton: UIButton!
    @IBOutlet weak var departmentButton: UIButton!
    @IBOutlet weak var summonButton: UIButton!
    @IBOutlet weak var studyAbroadButton: UIButton!
    @IBOutlet weak var scholarshipButton: UIButton!
    
    var category: CategoryType?
    
    @IBAction func goToDetail(_ sender: UIButton) {
        switch sender.tag {
        case 0: category = CategoryType.lecture
        case 1: category = CategoryType.intensiveLecture
        case 2: category = CategoryType.notice
        case 3: category = CategoryType.other
        case 4: category = CategoryType.department
        case 5: category = CategoryType.call
        case 6: category = CategoryType.studyAbroad
        case 7: category = CategoryType.scholarship
        default: print("error rrrrr")
        }
        self.performSegue(withIdentifier: "toDetail", sender: self.category)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        classesButton.imageView?.contentMode = .scaleToFill
        
            
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let NextViewController = (segue.destination as? DetailViewController)!
        NextViewController.category = sender as? CategoryType
    }
}
