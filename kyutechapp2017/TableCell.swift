//
//  TableCell.swift
//  kyutechapp2017
//
//  Created by 塩田宰 on 2017/02/23.
//  Copyright © 2017年 塩田宰. All rights reserved.
//

import UIKit

class TableCell: UICollectionViewCell {
 
    override func draw(_ rect: CGRect) {
        self.layer.borderWidth = 1
        self.layer.borderColor = #colorLiteral(red: 0.8155969381, green: 0.8157377839, blue: 0.815588057, alpha: 1).cgColor
    }
    
}
