//
//  TableCell.swift
//  kyutechapp2017
//
//  Created by 塩田宰 on 2017/02/23.
//  Copyright © 2017年 塩田宰. All rights reserved.
//

import UIKit

protocol TimetableCellDelegate {
    func didPushedEditClassButton(tag: Int, classNameLabel: UILabel, classroomNumberLabel: UILabel)
}

class TimetableCell: UICollectionViewCell {
    
    @IBOutlet weak var classNameLabel: UILabel!
    @IBOutlet weak var classroomNumberLabel: UILabel!
    @IBOutlet weak var editClassButton: UIButton!
    var delegate: TimetableCellDelegate?
    
    override func draw(_ rect: CGRect) {
        self.layer.borderWidth = 1
        self.layer.borderColor = #colorLiteral(red: 0.9333333333, green: 0.9411764706, blue: 0.9490196078, alpha: 1).cgColor
    }
    
    @IBAction func pushEditClassButton(_ sender: Any) {
        self.delegate?.didPushedEditClassButton(tag: self.editClassButton.tag, classNameLabel: self.classNameLabel, classroomNumberLabel: self.classroomNumberLabel)
    }
    
}
