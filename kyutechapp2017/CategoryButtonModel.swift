//
//  CategoryLabel.swift
//  kyutechapp2017
//
//  Created by 山浦功 on 2017/02/27.
//  Copyright © 2017年 塩田宰. All rights reserved.
//

import UIKit

enum CategoryType{
    case classes, intensiveLecture, notice, other,department,call,studyAbroad,scholarship
    static let allValues = [classes,intensiveLecture,notice,other,department,call,studyAbroad,scholarship]
    
    var getImage: UIImage{
        switch self {
        case .classes: return #imageLiteral(resourceName: "classes")
        case .intensiveLecture: return #imageLiteral(resourceName: "intensive")
        case .notice: return #imageLiteral(resourceName: "news")
        case .other: return #imageLiteral(resourceName: "procedure")
        case .department: return #imageLiteral(resourceName: "department")
        case .call: return #imageLiteral(resourceName: "summon")
        case .studyAbroad: return #imageLiteral(resourceName: "studyAbroad")
        case .scholarship: return #imageLiteral(resourceName: "scholarship")
        }
    }
    
    var getLabelName: String{
        switch self {
        case .classes: return "授業"
        case .intensiveLecture: return "集中講義"
        case .notice: return "お知らせ"
        case .other: return "各種変更手続き"
        case .department: return "学科別"
        case .call: return "学生呼び出し"
        case .studyAbroad: return "留学"
        case .scholarship: return "奨学金"
        }
    }
    
    var getColor1: UIColor{
        switch self {
        case .classes: return KyutechColor.classesColor1()
        case .intensiveLecture: return KyutechColor.intensiveColor1()
        case .notice: return KyutechColor.newsColor1()
        case .other: return KyutechColor.procedureColor1()
        case .department: return KyutechColor.departmentColor1()
        case .call: return KyutechColor.summonColor1()
        case .studyAbroad: return KyutechColor.studyAbroadColor1()
        case .scholarship: return KyutechColor.scholarshipColor1()
        }
    }
    
    var getColor2: UIColor{
        switch self {
        case .classes: return KyutechColor.classesColor2()
        case .intensiveLecture: return KyutechColor.intensiveColor2()
        case .notice: return KyutechColor.newsColor2()
        case .other: return KyutechColor.procedureColor2()
        case .department: return KyutechColor.departmentColor2()
        case .call: return KyutechColor.summonColor2()
        case .studyAbroad: return KyutechColor.studyAbroadColor2()
        case .scholarship: return KyutechColor.scholarshipColor2()
        }
    }
    
    var getStartPoint:CGPoint{
        switch self {
        case .classes: return CGPoint(x: 0.0, y: 0.0)
        case .intensiveLecture: return CGPoint(x: 1.0, y: 0.0)
        case .notice: return CGPoint(x: 1.0, y:1.0)
        case .other: return CGPoint(x: 0.5, y: 0.0)
        case .department: return CGPoint(x: 0.0, y: 0.0)
        case .call: return CGPoint(x: 1.0, y: 0.0)
        case .studyAbroad: return CGPoint(x: 0.0, y: 0.0)
        case .scholarship: return CGPoint(x: 0.0, y: 0.0)
        }
    }
    
    var getEndPoint:CGPoint{
        switch self {
        case .classes: return CGPoint(x: 1.0, y: 1.0)
        case .intensiveLecture: return CGPoint(x: 0.0, y: 1.0)
        case .notice: return CGPoint(x: 0.0, y: 1.0)
        case .other: return CGPoint(x: 0.5, y: 1.0)
        case .department: return CGPoint(x: 1.0, y: 1.0)
        case .call: return CGPoint(x: 0.0, y: 1.0)
        case .studyAbroad: return CGPoint(x: 1.0, y: 1.0)
        case .scholarship: return CGPoint(x: 1.0, y: 1.0)
        }
    }
    
    var headerIcon: UIImage{
        switch self {
        case .classes: return #imageLiteral(resourceName: "classesIcon")
        case .intensiveLecture: return #imageLiteral(resourceName: "intensiveIcon")
        case .notice: return #imageLiteral(resourceName: "newsIcon")
        case .other: return #imageLiteral(resourceName: "proceduceIcon")
        case .department: return #imageLiteral(resourceName: "departmentIcon")
        case .call: return #imageLiteral(resourceName: "summonIcon")
        case .studyAbroad: return #imageLiteral(resourceName: "studyAbroadIcon")
        case .scholarship: return #imageLiteral(resourceName: "scholarshipIcon")
        }
    }
    
    var getGenre: Genre{
        switch self {
        case .classes: return Genre.lecture
        case .intensiveLecture: return Genre.intensiveLecture
        case .notice: return Genre.notice
        case .call: return Genre.call
        case .studyAbroad: return Genre.studyAbroad
        case .scholarship: return Genre.scholarship
        case .department: return Genre.homepage
        case .other: return Genre.other
        }
    }
}

//headerView --detailView

//使わない
//categorybutton
func setButtonBackgroundView(category: CategoryType, button: UIButton){
    let position1 = NSNumber(value: 0.0 as Float)
    let position2 = NSNumber(value: 1.0 as Float)
    let gradient = CAGradientLayer()
    let color1 = category.getColor1
    let color2 = category.getColor2
    let startPoint = category.getStartPoint
    let endPoint = category.getEndPoint
    let labelName = category.getLabelName
//    var imageName = category.getImage
    
    gradient.colors = [color1.cgColor, color2.cgColor]
    gradient.startPoint = startPoint
    gradient.endPoint = endPoint
    gradient.frame = button.frame
    gradient.locations = [position1, position2]
    button.layer.insertSublayer(gradient, at: 0)
    button.titleLabel?.text =  labelName

}
