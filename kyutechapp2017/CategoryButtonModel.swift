//
//  CategoryLabel.swift
//  kyutechapp2017
//
//  Created by 山浦功 on 2017/02/27.
//  Copyright © 2017年 塩田宰. All rights reserved.
//

import UIKit

enum CategoryType{
    case classes, intensive,news,procedure,department, summon, studyAbroad, scholarship
    
    static let allValues = [classes,intensive,news,procedure,department,summon,studyAbroad,scholarship]
    
    var getImageName: String{
        switch self {
        case .classes: return "classes"
        case .intensive: return "intensive"
        case .news: return "news"
        case .procedure: return "proceduce"
        case .department: return "department"
        case .summon: return "summon"
        case .studyAbroad: return "studyAbroad"
        case .scholarship: return "scholarship"
        }
    }
    
    var getLabelName: String{
        switch self {
        case .classes: return "授業"
        case .intensive: return "集中講義"
        case .news: return "お知らせ"
        case .procedure: return "各種変更手続き"
        case .department: return "学科別"
        case .summon: return "学生呼び出し"
        case .studyAbroad: return "留学"
        case .scholarship: return "奨学金"
        }
    }
    
    var getColor1: UIColor{
        switch self {
        case .classes: return .classesColor_1
        case .intensive: return .intensiveColor_1
        case .news: return .news_1
        case .procedure: return .procedure_1
        case .department: return .department_1
        case .summon: return .summon_1
        case .studyAbroad: return .studyAbroad_1
        case .scholarship: return .scholarship_1
        }
    }
    
    var getColor2: UIColor{
        switch self {
        case .classes: return .classesColor_2
        case .intensive: return .intensiveColor_2
        case .news: return .news_2
        case .procedure: return .procedure_2
        case .department: return .department_2
        case .summon: return .summon_2
        case .studyAbroad: return .studyAbroad_2
        case .scholarship: return .scholarship_2
        }
    }
    
    var getStartPoint:CGPoint{
        switch self {
        case .classes: return CGPoint(x: 0.0, y: 0.0)
        case .intensive: return CGPoint(x: 1.0, y: 0.0)
        case .news: return CGPoint(x: 1.0, y:1.0)
        case .procedure: return CGPoint(x: 0.5, y: 0.0)
        case .department: return CGPoint(x: 0.0, y: 0.0)
        case .summon: return CGPoint(x: 1.0, y: 0.0)
        case .studyAbroad: return CGPoint(x: 0.0, y: 0.0)
        case .scholarship: return CGPoint(x: 0.0, y: 0.0)
        }
    }
    
    var getEndPoint:CGPoint{
        switch self {
        case .classes: return CGPoint(x: 1.0, y: 1.0)
        case .intensive: return CGPoint(x: 0.0, y: 1.0)
        case .news: return CGPoint(x: 0.0, y: 1.0)
        case .procedure: return CGPoint(x: 0.5, y: 1.0)
        case .department: return CGPoint(x: 1.0, y: 1.0)
        case .summon: return CGPoint(x: 0.0, y: 1.0)
        case .studyAbroad: return CGPoint(x: 1.0, y: 1.0)
        case .scholarship: return CGPoint(x: 1.0, y: 1.0)
        }
    }
}


struct CategoryButton{
    let position1 = NSNumber(value: 0.0 as Float)
    let position2 = NSNumber(value: 1.0 as Float)
    let gradient = CAGradientLayer()
    
    var category: CategoryType
    var color1: UIColor
    var color2: UIColor
    var startPoint: CGPoint
    var endPoint: CGPoint
    var labelName: String
    var imageName: String
    
    init(button:UIButton) {
        for number in CategoryType.allValues{
            if button.currentTitle == number.getLabelName{
                category = number
                break
            }
        }
        color1 = category.getColor1
        color2 = category.getColor2
        startPoint = category.getStartPoint
        endPoint = category.getEndPoint
        labelName = category.getLabelName
        imageName = category.getImageName
    }
    
    mutating func setGradationValues(button: UIButton){
        color1 = category.getColor1
        color2 = category.getColor2
        startPoint = category.getStartPoint
        endPoint = category.getEndPoint
        
        gradient.colors = [color1, color2]
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        gradient.frame = button.frame
        gradient.locations = [position1, position2]
        button.layer.insertSublayer(gradient, at: 0)
    }
    
    mutating func setImage(button: UIButton){
//        button.imageView.image = 
    }
    
    mutating func setLabel(button: UIButton){
        button.titleLabel?.text = category.getLabelName
//        button.titleRect(forContentRect: button.bounds)
    }
}


func SetButtonView(button:UIButton, type:String, image:UIImage, label:UILabel){
    var categoryButton = CategoryButton(button: button)
    
    categoryButton.setGradationValues(button: button)
    categoryButton.setImage(button: button)
    categoryButton.setImage(button: button)
}


