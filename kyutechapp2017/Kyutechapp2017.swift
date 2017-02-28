//
//  Kyutechapp2017.swift
//  kyutechapp2017
//
//  Created by 塩田宰 on 2017/02/27.
//  Copyright © 2017年 塩田宰. All rights reserved.
//

import UIKit

fileprivate struct Kyutechapp2017 {
    
    // App's basic color
    struct color {
        static let themeColor: UIColor = #colorLiteral(red: 0.3333333333, green: 0.7294117647, blue: 0.8823529412, alpha: 1)
        static let lightGray: UIColor = #colorLiteral(red: 0.9333333333, green: 0.9411764706, blue: 0.9490196078, alpha: 1)
        static let darkGray: UIColor = #colorLiteral(red: 0.6666666667, green: 0.6980392157, blue: 0.7411764706, alpha: 1)
    }
    
    // Timetable's color
    struct timetableColor {
        static let cellBackground1: UIColor = #colorLiteral(red: 0.4274509804, green: 0.7411764706, blue: 0.5215686275, alpha: 1)
        static let cellBackgroundSub1: UIColor = #colorLiteral(red: 0.6039215686, green: 0.8156862745, blue: 0.6705882353, alpha: 1)
        static let cellBackground2: UIColor = #colorLiteral(red: 0.5294117647, green: 0.8, blue: 0.7843137255, alpha: 1)
        static let cellBackgroundSub2: UIColor = #colorLiteral(red: 0.6745098039, green: 0.8588235294, blue: 0.8509803922, alpha: 1)
        static let cellBackground3: UIColor = #colorLiteral(red: 0.3333333333, green: 0.7294117647, blue: 0.8823529412, alpha: 1)
        static let cellBackgroundSub3: UIColor = #colorLiteral(red: 0.5411764706, green: 0.8117647059, blue: 0.9098039216, alpha: 1)
        static let cellBackground4: UIColor = #colorLiteral(red: 0.3725490196, green: 0.6666666667, blue: 0.8509803922, alpha: 1)
        static let cellBackgroundSub4: UIColor = #colorLiteral(red: 0.5529411765, green: 0.768627451, blue: 0.8941176471, alpha: 1)
        static let cellBackground5: UIColor = #colorLiteral(red: 0.9607843137, green: 0.5725490196, blue: 0.2705882353, alpha: 1)
        static let cellBackgroundSub5: UIColor = #colorLiteral(red: 0.9607843137, green: 0.7019607843, blue: 0.5058823529, alpha: 1)
        static let cellBackground6: UIColor = #colorLiteral(red: 1, green: 0.7647058824, blue: 0.2705882353, alpha: 1)
        static let cellBackgroundSub6: UIColor = #colorLiteral(red: 0.9960784314, green: 0.831372549, blue: 0.5137254902, alpha: 1)
        static let cellBackground7: UIColor = #colorLiteral(red: 0.9215686275, green: 0.3411764706, blue: 0.4078431373, alpha: 1)
        static let cellBackgroundSub7: UIColor = #colorLiteral(red: 0.937254902, green: 0.5411764706, blue: 0.5882352941, alpha: 1)
        static let cellBackground8: UIColor = #colorLiteral(red: 0.9333333333, green: 0.4156862745, blue: 0.4117647059, alpha: 1)
        static let cellBackgroundSub8: UIColor = #colorLiteral(red: 0.9450980392, green: 0.5960784314, blue: 0.5960784314, alpha: 1)
    }
    
}

/*
    Timetable's
*/
struct KyutechColor {
  
    static func themeColor() -> UIColor {
        return Kyutechapp2017.color.themeColor
    }
    
    static func lightGray() -> UIColor {
        return Kyutechapp2017.color.lightGray
    }
    
    static func darkGray() -> UIColor {
        return Kyutechapp2017.color.darkGray
    }
    
    static func cellBackground1() -> UIColor {
        return Kyutechapp2017.timetableColor.cellBackground1
    }
    
    static func cellBackgroundSub1() -> UIColor {
        return Kyutechapp2017.timetableColor.cellBackgroundSub1
    }
    
    static func cellBackground2() -> UIColor {
        return Kyutechapp2017.timetableColor.cellBackground2
    }
    
    static func cellBackgroundSub2() -> UIColor {
        return Kyutechapp2017.timetableColor.cellBackgroundSub2
    }
    
    static func cellBackground3() -> UIColor {
        return Kyutechapp2017.timetableColor.cellBackground3
    }
    
    static func cellBackgroundSub3() -> UIColor {
        return Kyutechapp2017.timetableColor.cellBackgroundSub3
    }
    
    static func cellBackground4() -> UIColor {
        return Kyutechapp2017.timetableColor.cellBackground4
    }
    
    static func cellBackgroundSub4() -> UIColor {
        return Kyutechapp2017.timetableColor.cellBackgroundSub4
    }
    
    static func cellBackground5() -> UIColor {
        return Kyutechapp2017.timetableColor.cellBackground5
    }
    
    static func cellBackgroundSub5() -> UIColor {
        return Kyutechapp2017.timetableColor.cellBackgroundSub5
    }
    
    static func cellBackground6() -> UIColor {
        return Kyutechapp2017.timetableColor.cellBackground6
    }
    
    static func cellBackgroundSub6() -> UIColor {
        return Kyutechapp2017.timetableColor.cellBackgroundSub6
    }
    
    static func cellBackground7() -> UIColor {
        return Kyutechapp2017.timetableColor.cellBackground7
    }
    
    static func cellBackgroundSub7() -> UIColor {
        return Kyutechapp2017.timetableColor.cellBackgroundSub7
    }
    
    static func cellBackground8() -> UIColor {
        return Kyutechapp2017.timetableColor.cellBackground8
    }
    
    static func cellBackgroundSub8() -> UIColor {
        return Kyutechapp2017.timetableColor.cellBackgroundSub8
    }
}
