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
    
    @IBOutlet var BackgroundView: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setColors()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setColors(){
        setClassesBackView(button: classesButton)
        setIntensiveBackView(button: intensiveButton)
        setNewsBackView(button: newsButton)
        setProcedureBackView(button: procedureButton)
        setDepartmentBackView(button: departmentButton)
        setSummonBackView(button: summonButton)
        setStudyAbroadBackView(button: studyAbroadButton)
        setScholarshipBackView(button: scholarshipButton)
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


