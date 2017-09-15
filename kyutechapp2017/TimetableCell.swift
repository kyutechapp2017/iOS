//
//  TableCell.swift
//  kyutechapp2017
//
//  Created by 塩田宰 on 2017/02/23.
//  Copyright © 2017年 塩田宰. All rights reserved.
//

import UIKit

protocol TimetableCellDelegate {
    func didPushedEditClassButton(editClassButton: UIButton, classNameLabel: UILabel, classroomNumberLabel: UILabel)
}

class TimetableCell: UICollectionViewCell {
    
    @IBOutlet weak var classNameLabel: UILabel!
    @IBOutlet weak var classroomNumberLabel: UILabel!
    @IBOutlet weak var editClassButton: UIButton!
    
    let selectedImage = UIImage(named: "selected")
    // let notSelectedImage = UIImage(named: "not_selected")
    
    var delegate: TimetableCellDelegate?
    
    override func draw(_ rect: CGRect) {
        self.layer.borderWidth = 1
        self.layer.borderColor = #colorLiteral(red: 0.9333333333, green: 0.9411764706, blue: 0.9490196078, alpha: 1).cgColor
    }
    
    @IBAction func pushEditClassButton(_ sender: Any) {
        self.editClassButton.setImage(self.selectedImage, for: UIControlState.normal)
        self.delegate?.didPushedEditClassButton(editClassButton: self.editClassButton, classNameLabel: self.classNameLabel, classroomNumberLabel: self.classroomNumberLabel)
        // self.editClassButton.setImage(self.notSelectedImage, for: UIControlState.normal)
    }
    
}
