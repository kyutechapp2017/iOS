//
//  CategoryView.swift
//  kyutechapp2017
//
//  Created by 山浦功 on 2017/03/21.
//  Copyright © 2017年 塩田宰. All rights reserved.
//

import UIKit

@IBDesignable class CategoryView: UIView {
    
    var view = UIView()
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
    
    //xib　読み込み時に呼ばれる
    override func awakeFromNib() {
        print("xibが呼ばれました")
    }
    
    //Autolayoutなどサブビューのレイアウト敵用後に呼ばれる
    override func layoutSubviews() {
        print("layoutSubviews")
    }
    
    func setUp(){
        categoryLabel.text = String("gggg")
        categoryImage.image = UIImage(named: "category")
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth,UIViewAutoresizing.flexibleHeight]
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView{
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
}
