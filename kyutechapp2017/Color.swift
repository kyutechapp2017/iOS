//
//  Colors.swift
//  kyutechapp2017
//
//  Created by 山浦功 on 2017/02/24.
//  Copyright © 2017年 塩田宰. All rights reserved.
//

import UIKit

func categoryButton(button: UIButton, color_start:UIColor, color_end:UIColor, start_x:CGFloat, start_y:CGFloat, end_x:CGFloat, end_y:CGFloat){
    let gradient = CAGradientLayer()
    let position_1 = NSNumber(value: 0.0 as Float)
    let position_2 = NSNumber(value: 1.0 as Float)
    let startPoint = CGPoint(x: start_x, y: start_y)
    let endPoint = CGPoint(x: end_x, y: end_y)
    gradient.colors = [color_start.cgColor,color_end.cgColor]
    gradient.startPoint = startPoint
    gradient.endPoint = endPoint
    gradient.frame = button.bounds
    gradient.locations = [position_1, position_2]
    button.layer.insertSublayer(gradient, at: 0)
}
