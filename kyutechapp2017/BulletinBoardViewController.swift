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
        setClassesBackView(Button: classesButton)
        setIntensiveBackView(Button: intensiveButton)
        setNewsBackView(Button: newsButton)
        setProcedureBackView(Button: procedureButton)
        setDepartmentBackView(Button: departmentButton)
        setSummonBackView(Button: summonButton)
        setStudyAbroadBackView(Button: studyAbroadButton)
        setScholarshipBackView(Button: scholarshipButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setClassesBackView(Button: UIButton){
        let gradient = CAGradientLayer()
        gradient.frame = Button.bounds
        
        let color_1 = UIColor(red: 129/255, green: 171/255, blue: 115/255, alpha: 1.0).cgColor
        let color_2 = UIColor(red: 103/255, green: 179/255, blue: 126/255, alpha: 1.0).cgColor
        
        gradient.colors = [color_1, color_2]
        
        let position_1 = NSNumber(value: 0.0 as Float)
        let position_2 = NSNumber(value: 1.0 as Float)
        
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.locations = [position_1, position_2]
        Button.layer.insertSublayer(gradient, at:0)
    }
    
    func setIntensiveBackView(Button: UIButton){
        let gradient = CAGradientLayer()
        gradient.frame = Button.bounds
        
        let color_1 = UIColor(red: 0/255, green: 169/255, blue: 157/255, alpha: 1.0).cgColor
        let color_2 = UIColor(red: 79/255, green: 206/255, blue: 173/255, alpha: 1.0).cgColor
        
        gradient.colors = [color_1, color_2]
        
        let position_1 = NSNumber(value: 0.0 as Float)
        let position_2 = NSNumber(value: 1.0 as Float)
        
        gradient.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.locations = [position_1, position_2]
        Button.layer.insertSublayer(gradient, at:0)
    }
    
    func setNewsBackView(Button: UIButton){
        let gradient = CAGradientLayer()
        gradient.frame = Button.bounds
        
        let color_1 = UIColor(red: 244/255, green: 186/255, blue: 78/255, alpha: 1.0).cgColor
        let color_2 = UIColor(red: 245/255, green: 146/255, blue: 69/255, alpha: 1.0).cgColor
        
        gradient.colors = [color_1, color_2]
        
        let position_1 = NSNumber(value: 0.0 as Float)
        let position_2 = NSNumber(value: 1.0 as Float)
        
        gradient.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.locations = [position_1, position_2]
        Button.layer.insertSublayer(gradient, at:0)
    }
    
    func setProcedureBackView(Button: UIButton){
        let gradient = CAGradientLayer()
        gradient.frame = Button.bounds
        
        let color_1 = UIColor(red: 231/255, green: 88/255, blue: 69/255, alpha: 1.0).cgColor
        let color_2 = UIColor(red: 250/255, green: 111/255, blue: 87/255, alpha: 1.0).cgColor
        
        gradient.colors = [color_1, color_2]
        
        let position_1 = NSNumber(value: 0.0 as Float)
        let position_2 = NSNumber(value: 1.0 as Float)
        
        gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
        gradient.locations = [position_1, position_2]
        Button.layer.insertSublayer(gradient, at:0)
    }
    
    func setDepartmentBackView(Button: UIButton){
        let gradient = CAGradientLayer()
        gradient.frame = Button.bounds
        
        let color_1 = UIColor(red: 85/255, green: 186/255, blue: 225/255, alpha: 1.0).cgColor
        let color_2 = UIColor(red: 96/255, green: 159/255, blue: 233/255, alpha: 1.0).cgColor
        
        gradient.colors = [color_1, color_2]
        
        let position_1 = NSNumber(value: 0.0 as Float)
        let position_2 = NSNumber(value: 1.0 as Float)
        
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.locations = [position_1, position_2]
        Button.layer.insertSublayer(gradient, at:0)
    }

    func setSummonBackView(Button: UIButton){
        let gradient = CAGradientLayer()
        gradient.frame = Button.bounds
        
        let color_1 = UIColor(red: 216/255, green: 70/255, blue: 85/255, alpha: 1.0).cgColor
        let color_2 = UIColor(red: 231/255, green: 88/255, blue: 69/255, alpha: 1.0).cgColor
        
        gradient.colors = [color_1, color_2]
        
        let position_1 = NSNumber(value: 0.0 as Float)
        let position_2 = NSNumber(value: 1.0 as Float)
        
        gradient.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.locations = [position_1, position_2]
        Button.layer.insertSublayer(gradient, at:0)
    }
    
    func setStudyAbroadBackView(Button: UIButton){
        let gradient = CAGradientLayer()
        gradient.frame = Button.bounds
        
        let color_1 = UIColor(red: 85/255, green: 192/255, blue: 231/255, alpha: 1.0).cgColor
        let color_2 = UIColor(red: 101/255, green: 191/255, blue: 189/255, alpha: 1.0).cgColor
        
        gradient.colors = [color_1, color_2]
        
        let position_1 = NSNumber(value: 0.0 as Float)
        let position_2 = NSNumber(value: 1.0 as Float)
        
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.locations = [position_1, position_2]
        Button.layer.insertSublayer(gradient, at:0)
    }
    
    func setScholarshipBackView(Button: UIButton){
        let gradient = CAGradientLayer()
        gradient.frame = Button.bounds
        
        let color_1 = UIColor(red: 253/255, green: 177/255, blue: 123/255, alpha: 1.0).cgColor
        let color_2 = UIColor(red: 234/255, green: 137/255, blue: 191/255, alpha: 1.0).cgColor
        
        gradient.colors = [color_1, color_2]
        
        let position_1 = NSNumber(value: 0.0 as Float)
        let position_2 = NSNumber(value: 1.0 as Float)
        
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.locations = [position_1, position_2]
        Button.layer.insertSublayer(gradient, at:0)
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


