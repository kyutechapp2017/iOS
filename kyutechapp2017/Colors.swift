//
//  Colors.swift
//  kyutechapp2017
//
//  Created by 山浦功 on 2017/02/24.
//  Copyright © 2017年 塩田宰. All rights reserved.
//

import UIKit

enum ButtonTag:Int{
    case classes = 1
    case intensive = 2
    case news = 3
    case procedure = 4
    case department = 5
    case summon = 6
    case studyAbroad = 7
    case scholarship = 8
    
    static let allValues = [classes,intensive,news,procedure,department,summon,studyAbroad,scholarship]
    
    func name() -> String{
        switch self {
        case .classes: return "classesButton"
        case .intensive: return "intensiveButton"
        case .news: return "newsButton"
        case .procedure: return "procedureButton"
        case .department: return "departmentButton"
        case .summon: return "summonButton"
        case .studyAbroad: return "studyAbroadButton"
        case .scholarship: return "scholarshipButton"
        }
    }
}


struct CategoryButton {
    var color1: UIColor!
    var color2: UIColor!
    var startPoint: CGPoint!
    var endPoint: CGPoint!
    var tag: ButtonTag!
    mutating func setTag(button: UIButton){
    }
    mutating func setColorValues(value: Int){
        switch value {
        case 1: //Classes
            color1 = UIColor.classesColor_1
            color2 = UIColor.classesColor_2
            startPoint = CGPoint(x: 0.0, y: 0.0)
            endPoint = CGPoint(x: 1.0, y: 1.0)
        case 2: //Intensive
            color1 = UIColor.intensiveColor_1
            color2 = UIColor.intensiveColor_2
            startPoint = CGPoint(x: 1.0, y: 0.0)
            endPoint = CGPoint(x: 0.0, y: 1.0)
        case 3: //News
            color1 = UIColor.news_1
            color2 = UIColor.news_2
            startPoint = CGPoint(x: 1.0, y: 0.0)
            endPoint = CGPoint(x: 0.0, y: 1.0)
        case 4: //Procedure
            color1 = UIColor.procedure_1
            color2 = UIColor.procedure_2
            startPoint = CGPoint(x: 0.5, y: 0.0)
            endPoint = CGPoint(x: 0.5, y: 1.0)
        case 5: //Department
            color1 = UIColor.department_1
            color2 = UIColor.department_2
            startPoint = CGPoint(x: 0.0, y: 0.0)
            endPoint = CGPoint(x: 1.0, y: 1.0)
        case 6: //summon
            color1 = UIColor.summon_1
            color2 = UIColor.summon_2
            startPoint = CGPoint(x: 1.0, y: 0.0)
            endPoint = CGPoint(x: 0.0, y: 1.0)
        case 7: //studyAbroad
            color1 = UIColor.studyAbroad_1
            color2 = UIColor.studyAbroad_2
            startPoint = CGPoint(x: 0.0, y: 0.0)
            endPoint = CGPoint(x: 1.0, y: 1.0)
        case 8: //scholarship
            color1 = UIColor.scholarship_1
            color2 = UIColor.studyAbroad_2
            startPoint = CGPoint(x: 0.0, y: 0.0)
            endPoint = CGPoint(x: 1.0, y: 1.0)
        default:
            print("color error")
        }
    }
}
