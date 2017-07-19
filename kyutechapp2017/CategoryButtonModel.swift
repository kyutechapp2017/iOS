//
//  CategoryLabel.swift
//  kyutechapp2017
//
//  Created by 山浦功 on 2017/02/27.
//  Copyright © 2017年 塩田宰. All rights reserved.
//

import UIKit

enum CategoryType{
    case lecture, intensiveLecture, notice, procedure,department,summon,studyAbroad,scholarship
    static let allValues = [lecture,intensiveLecture,notice,procedure,department,summon,studyAbroad,scholarship]
    
    var getImage: UIImage{
        switch self {
        case .lecture: return #imageLiteral(resourceName: "classes")
        case .intensiveLecture: return #imageLiteral(resourceName: "intensive")
        case .notice: return #imageLiteral(resourceName: "news")
        case .procedure: return #imageLiteral(resourceName: "procedure")
        case .department: return #imageLiteral(resourceName: "department")
        case .summon: return #imageLiteral(resourceName: "summon")
        case .studyAbroad: return #imageLiteral(resourceName: "studyAbroad")
        case .scholarship: return #imageLiteral(resourceName: "scholarship")
        }
    }
    
    var getLabelName: String{
        switch self {
        case .lecture: return "授業"
        case .intensiveLecture: return "集中講義"
        case .notice: return "お知らせ"
        case .procedure: return "各種変更手続き"
        case .department: return "学科別"
        case .summon: return "学生呼び出し"
        case .studyAbroad: return "留学"
        case .scholarship: return "奨学金"
        }
    }
    
    var getColor1: UIColor{
        switch self {
        case .lecture: return .classesColor_1
        case .intensiveLecture: return .intensiveColor_1
        case .notice: return .news_1
        case .procedure: return .procedure_1
        case .department: return .department_1
        case .summon: return .summon_1
        case .studyAbroad: return .studyAbroad_1
        case .scholarship: return .scholarship_1
        }
    }
    
    var getColor2: UIColor{
        switch self {
        case .lecture: return .classesColor_2
        case .intensiveLecture: return .intensiveColor_2
        case .notice: return .news_2
        case .procedure: return .procedure_2
        case .department: return .department_2
        case .summon: return .summon_2
        case .studyAbroad: return .studyAbroad_2
        case .scholarship: return .scholarship_2
        }
    }
    
    var getStartPoint:CGPoint{
        switch self {
        case .lecture: return CGPoint(x: 0.0, y: 0.0)
        case .intensiveLecture: return CGPoint(x: 1.0, y: 0.0)
        case .notice: return CGPoint(x: 1.0, y:1.0)
        case .procedure: return CGPoint(x: 0.5, y: 0.0)
        case .department: return CGPoint(x: 0.0, y: 0.0)
        case .summon: return CGPoint(x: 1.0, y: 0.0)
        case .studyAbroad: return CGPoint(x: 0.0, y: 0.0)
        case .scholarship: return CGPoint(x: 0.0, y: 0.0)
        }
    }
    
    var getEndPoint:CGPoint{
        switch self {
        case .lecture: return CGPoint(x: 1.0, y: 1.0)
        case .intensiveLecture: return CGPoint(x: 0.0, y: 1.0)
        case .notice: return CGPoint(x: 0.0, y: 1.0)
        case .procedure: return CGPoint(x: 0.5, y: 1.0)
        case .department: return CGPoint(x: 1.0, y: 1.0)
        case .summon: return CGPoint(x: 0.0, y: 1.0)
        case .studyAbroad: return CGPoint(x: 1.0, y: 1.0)
        case .scholarship: return CGPoint(x: 1.0, y: 1.0)
        }
    }
    
    var headerIcon: UIImage{
        switch self {
        case .lecture: return #imageLiteral(resourceName: "classesIcon")
        case .intensiveLecture: return #imageLiteral(resourceName: "intensiveIcon")
        case .notice: return #imageLiteral(resourceName: "newsIcon")
        case .procedure: return #imageLiteral(resourceName: "proceduceIcon")
        case .department: return #imageLiteral(resourceName: "departmentIcon")
        case .summon: return #imageLiteral(resourceName: "summonIcon")
        case .studyAbroad: return #imageLiteral(resourceName: "studyAbroadIcon")
        case .scholarship: return #imageLiteral(resourceName: "scholarshipIcon")
        }
    }
}




//headerView --detailView
func setHeaderView(view: UIView, imageView: UIImageView, label: UILabel, category: CategoryType){
    let gradient = CAGradientLayer()
    gradient.colors = [category.getColor1.cgColor, category.getColor2.cgColor]
    gradient.startPoint = category.getStartPoint
    gradient.endPoint = category.getEndPoint
    gradient.frame = view.frame
    gradient.locations = [NSNumber(value: 0.0 as Float), NSNumber(value: 1.0 as Float)]
    view.layer.insertSublayer(gradient, at: 0)
    imageView.image = category.headerIcon
    label.text = category.getLabelName
}




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







//class CategoryBackgroundButton{
//    
//    init(button:UIButton, buttonCategory:CategoryType) {
//        self.category = buttonCategory
//        self.color1 = self.category.getColor1
//        self.color2 = self.category.getColor2
//        self.startPoint = self.category.getStartPoint
//        self.endPoint = self.category.getEndPoint
//        self.labelName = self.category.getLabelName
//        self.imageName = self.category.getImageName
//    }
//    

//    func setLabel(button: UIButton){
//       //        button.titleRect(forContentRect: button.bounds)
//    }
//}



//func setButtonView(button:UIButton, type:CategoryType){
//    var categoryButton = CategoryBackgroundButton(button: button, buttonCategory: type)
//    
//    // set backgroundview
//    categoryButton.setGradationValues(button: button)
//    
//    // set image
//    // set label
//    categoryButton.setLabel(button: button)
//}
