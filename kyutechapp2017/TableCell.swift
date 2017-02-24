//
//  TableCell.swift
//  kyutechapp2017
//
//  Created by 塩田宰 on 2017/02/23.
//  Copyright © 2017年 塩田宰. All rights reserved.
//

import UIKit

class TableCell: UICollectionViewCell, UIGestureRecognizerDelegate, EditViewDisplayDelegate {
    
    @IBOutlet weak var editCellView: UIView!
    
    override func draw(_ rect: CGRect) {
        self.layer.borderWidth = 1
        self.layer.borderColor = #colorLiteral(red: 0.9333333333, green: 0.9411764706, blue: 0.9490196078, alpha: 1).cgColor
    }
    
    func didTappedEditButton() {
        self.editCellView.isHidden == true ? (self.editCellView.isHidden = false) : (self.editCellView.isHidden = true)
    }
    
}
