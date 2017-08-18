//
//  ScholarshipView.swift
//  kyutechapp2017
//
//  Created by 山浦功 on 2017/08/18.
//  Copyright © 2017年 塩田宰. All rights reserved.
//奨学金


import UIKit

class NoticeView: UIView {
    
   

    override init(frame: CGRect) {
        super.init(frame: frame)
//        setView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        setView()
    }
    
    private func commonInit(){
        
    }
    
    func setData(noticeModel: Notice){
        let periodView = ContentView()
        let placeOrBeforeView = ContentView()
        let contentView = ContentView()
        let departmentView = ContentView()
        let gradeView = ContentView()
        
        periodView.titleLabel.text = "時限"
        periodView.contentLabel.text = noticeModel.period
        
        placeOrBeforeView.titleLabel.text = "場所/教室"
        placeOrBeforeView.contentLabel.text = noticeModel.placeOrBefore
        
        contentView.titleLabel.text = "内容"
        contentView.contentLabel.text = noticeModel.content
        
        departmentView.titleLabel.text = "対象学科"
        departmentView.contentLabel.text = noticeModel.department
        
        gradeView.titleLabel.text = "対象学年"
        gradeView.contentLabel.text = noticeModel.grade
        
        addSubview(periodView)
        addSubview(placeOrBeforeView)
        addSubview(contentView)
        addSubview(departmentView)
        addSubview(gradeView)
    }
}


class LectureView: UIView {
    
    //    override func draw(_ rect: CGRect) {
    //        setLabelText()
    //    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}


class CallView: UIView {
    
    //    override func draw(_ rect: CGRect) {
    //        setLabelText()
    //    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}


class IntensiveLectureView: UIView {
    
    //    override func draw(_ rect: CGRect) {
    //        setLabelText()
    //    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}


class StudyAbroadView: UIView {
    
    //    override func draw(_ rect: CGRect) {
    //        setLabelText()
    //    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}


class ScholarshipView: UIView {
    
    //    override func draw(_ rect: CGRect) {
    //        setLabelText()
    //    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}


class OtherView: UIView {
    
    //    override func draw(_ rect: CGRect) {
    //        setLabelText()
    //    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}


class HomePageView: UIView {
    
    //    override func draw(_ rect: CGRect) {
    //        setLabelText()
    //    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
