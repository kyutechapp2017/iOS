//
//  CategoryView.swift
//  kyutechapp2017
//
//  Created by 山浦功 on 2017/03/21.
//  Copyright © 2017年 塩田宰. All rights reserved.
//

import UIKit

class CategoryView: UIView {
    
//    var view = UIView
    let nibName = "CategoryView"
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryImage: UIImageView!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
        setUp()
    }
    
    func setUp(){
        categoryLabel.text = String("gggg")
        categoryImage.image = UIImage(named: "category")
    }
    
    func loadViewFromNib() -> UIView{
        let bundle = Bundle(for: self.)
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.i
    }
}
