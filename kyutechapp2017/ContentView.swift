//
//  TitleVIew.swift
//  kyutechapp2017
//
//  Created by 山浦功 on 2017/08/18.
//  Copyright © 2017年 塩田宰. All rights reserved.
//

import UIKit

class ContentView: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var contentLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup(){
        titleLabel.textAlignment = NSTextAlignment.left
        lineView.backgroundColor = UIColor.black
//        lineView.bounds = CGRect(x: 0, y: titleLabel.bounds.height, width: self.bounds.width, height: 1)
        let view = Bundle.main.loadNibNamed("TitleView", owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        view.backgroundColor = UIColor.yellow
        self.addSubview(view)
        self.addSubview(titleLabel)
        self.addSubview(lineView)
        self.addSubview(contentLabel)

    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
}
