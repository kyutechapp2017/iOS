//
//  DetailTableViewCell.swift
//  kyutechapp2017
//
//  Created by 山浦功 on 2017/03/13.
//  Copyright © 2017年 塩田宰. All rights reserved.
//

import UIKit

class DetailCell: FoldingCell {
    

//    var number: Int = 0{
//        didSet{
//            closeNumberLabel.text = String(number)
//            openNumberLabel.text = String(number)
//        }
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func animationDuration(_ itemIndex: NSInteger, type: FoldingCell.AnimationType) -> TimeInterval {
        let durations = [0.33, 0.22, 0.26]
        return durations[itemIndex]
    }
    
    //override func setInfoToView(view: UIView, bulletinModel: BulletinModel, indexPath: IndexPath){
    //    //set view and info
    //}

}
