//
//  TableCell.swift
//  kyutechapp2017
//
//  Created by 塩田宰 on 2017/02/23.
//  Copyright © 2017年 塩田宰. All rights reserved.
//

import UIKit

protocol TableCellDelegate {
    func didPushedEditClassButton(tag: Int)
}

class TableCell: UICollectionViewCell {
    
    @IBOutlet weak var editClassButton: UIButton!
    var delegate: TableCellDelegate?
    
    override func draw(_ rect: CGRect) {
        self.layer.borderWidth = 1
        self.layer.borderColor = #colorLiteral(red: 0.9333333333, green: 0.9411764706, blue: 0.9490196078, alpha: 1).cgColor
    }
    
    @IBAction func pushEditClassButton(_ sender: Any) {
        print("hoge")
        self.delegate?.didPushedEditClassButton(tag: self.editClassButton.tag)
    }
}
