
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
    
    
    @IBAction func goToDetail(_ sender: UIButton) {
        print("ボタン！！")
        self.performSegue(withIdentifier: "toDetail", sender: self)
    }

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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let NextViewController = (segue.destination as? DetailViewController)!
        if let button = sender as? UIButton{
            let tag = button.tag
            switch tag{
            case 0: NextViewController.category = CategoryType.classes
            case 1: NextViewController.category = CategoryType.intensive
            case 2: NextViewController.category = CategoryType.news
            case 3: NextViewController.category = CategoryType.procedure
            case 4: NextViewController.category = CategoryType.department
            case 5: NextViewController.category = CategoryType.summon
            case 6: NextViewController.category = CategoryType.studyAbroad
            case 7: NextViewController.category = CategoryType.scholarship
            default: print("failed to segue")
            }
            print("遷移しますよ！")
        }
    }
}
