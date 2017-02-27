//
//  CategoryLabel.swift
//  kyutechapp2017
//
//  Created by 山浦功 on 2017/02/27.
//  Copyright © 2017年 塩田宰. All rights reserved.
//

import UIKit


struct CategoryLabel {
    static let color = UIColor.labelColor
    var position: CGPoint!
    static let alignment = NSTextAlignment.center
//    static let font = 
    
    
    struct classes{
        static let size = UIFont.systemFont(ofSize: 40.0)
    }
    
    struct intensive{
        static let size = UIFont.systemFont(ofSize: 35.0)
    }
    
    struct news {
        static let size = UIFont.systemFont(ofSize: 30.0)
    }
    
    struct procedure {
    }
    
    struct department {
    }
    
    struct summon {
    }
    
    struct studyAbroad {
    }
    
    struct scholarship {
    }
}


