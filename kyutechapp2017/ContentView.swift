//
//  TitleVIew.swift
//  kyutechapp2017
//
//  Created by 山浦功 on 2017/08/18.
//  Copyright © 2017年 塩田宰. All rights reserved.
//

import UIKit

class ContentView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        setup()
    }
    
//    func setup(){
////        titleLabel.textAlignment = NSTextAlignment.left
////        lineView.backgroundColor = UIColor.black
////        lineView.bounds = CGRect(x: 0, y: titleLabel.bounds.height, width: self.bounds.width, height: 1)
//        let view = Bundle.main.loadNibNamed("TitleView", owner: self, options: nil)?.first as! UIView
//        view.frame = self.bounds
//        view.backgroundColor = UIColor.yellow
//        self.addSubview(view)
//        self.addSubview(titleLabel)
//        self.addSubview(lineView)
//    }
    
    convenience init(title: String, content: String){
        self.init(frame: CGRect.zero)
        
        let titleLabel = UILabel()
        titleLabel.textAlignment = NSTextAlignment.left
        titleLabel.text = title
        titleLabel.frame = CGRect(x: 0, y: 30, width: 200, height: 50)
        titleLabel.backgroundColor = UIColor.black
        
        let lineView = UIView()
        lineView.frame = CGRect(x: 0.0, y: titleLabel.frame.maxY, width: self.frame.width, height: 30)
        lineView.backgroundColor = UIColor.black
        
        let contentLabel = UILabel()
        contentLabel.textAlignment = NSTextAlignment.left
        contentLabel.text = content
        contentLabel.frame = CGRect(x: 0.0, y: lineView.frame.maxY, width: self.frame.width, height: 30)
        contentLabel.backgroundColor = UIColor.black
        
        self.addSubview(titleLabel)
        self.addSubview(lineView)
        self.addSubview(contentLabel)
    }
}
