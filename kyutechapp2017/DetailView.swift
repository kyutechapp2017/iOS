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
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
//    convenience init(noticeModel: Notice){
//        self.init(frame: CGRect.zero)
//        let periodView = ContentView(title: "時限", content: "１限目")
//        let placeOrBeforeView = ContentView(title: "場所/教室", content: "1202教室")
//        let contentView = ContentView(title: "内容", content: "部屋が変更になりました。")
//        let departmentView = ContentView(title: "対象学科", content: "電子情報工学科")
//        let gradeView = ContentView(title: "対象学年", content: "３年")
//        
//        addSubview(periodView)
//        addSubview(placeOrBeforeView)
//        addSubview(contentView)
//        addSubview(departmentView)
//        addSubview(gradeView)
//    }
    convenience init(){
        self.init(frame: CGRect.zero)
        let periodView = ContentView(title: "時限", content: "１限目")
        let placeOrBeforeView = ContentView(title: "場所/教室", content: "1202教室")
        let contentView = ContentView(title: "内容", content: "部屋が変更になりました。")
        let departmentView = ContentView(title: "対象学科", content: "電子情報工学科")
        let gradeView = ContentView(title: "対象学年", content: "３年")
        
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
