//
//  TitleVIew.swift
//  kyutechapp2017
//
//  Created by 山浦功 on 2017/08/18.
//  Copyright © 2017年 塩田宰. All rights reserved.
//

import UIKit

class ContentView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        setup()
    }
    
    convenience init(model: BulletinModel, genre: Genre, num: Int){
        self.init(frame: CGRect.zero)
        switch genre {
        case .notice: noticeView(notice: model.notices[num])
        case .lecture: lectureView(lecture: model.lectures[num])
        case .call: callView(call: model.calls[num])
        case .intensiveLecture: intensiveLectureView(intensiveLecture: model.intensiveLectures[num])
        case .studyAbroad: studyAbroadView(studyAbroad: model.studyAbroads[num])
        case .scholarship: scholarshipView(scholarship: model.scholarships[num])
        case .homepage: homepageView(homepage: model.homepages[num])
        case .other: otherView(other: model.others[num])
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        setup()
    }
}

extension ContentView{
    func noticeView(notice: Notice){
        let labels = ["詳細", "対象学科","対象学年","時限","場所"]
        let contents = [notice.content, notice.department, notice.grade, notice.period, notice.placeOrBefore]
        print(labels)
        print(contents)
    }
    
    func lectureView(lecture: Lecture){
        let labels = ["詳細",
                      "科目",
                      "対象学科",
                      "対象学年",
                      "時限",
                      "担当教員/担当部署",
                      "場所/教室(変更前)",
                      "場所/教室(変更後)",
                      "備考/注記/特記/種別"]
        let contents = [lecture.content,
                        lecture.subject,
                        lecture.department,
                        lecture.grade,
                        lecture.period,
                        lecture.responsibility,
                        lecture.placeOrBefore,
                        lecture.after,
                        lecture.note ]
        
        print(labels)
        print(contents)
    }
    
    
    func callView(call: Call){
        let labels = ["詳細", "対象学科","対象学年","備考/注記/特記/種別","期日"]
        let contents = [call.content, call.grade, call.note, call.finish]
        print(labels)
        print(contents)

    }
    
    func intensiveLectureView(intensiveLecture: IntensiveLecture){
        let labels = ["詳細", "対象学科","対象学年","時限","場所"]
        var contents = [intensiveLecture.content, intensiveLecture.grade, intensiveLecture.period, intensiveLecture.placeOrBefore]
        print(labels)
        print(contents)
    }
    func studyAbroadView(studyAbroad: StudyAbroad){
        let labels = ["詳細", "対象学科","対象学年","時限","場所"]
        var contents = [notice.content, notice.department, notice.grade, notice.period, notice.placeOrBefore]
        print(labels)
        print(contents)
    }
    
    func scholarshipView(scholarship: Scholarship){
        let labels = ["詳細", "対象学科","対象学年","時限","場所"]
        var contents = [scholarship.content, scholarship.department, scholarship.grade, scholarship.period, scholarship.placeOrBefore]
        print(labels)
        print(contents)
    }
    
    func homepageView(homepage: Homepage){
        let labels = ["詳細", "対象学科","対象学年","時限","場所"]
        var contents = [homepage.content, homepage.department, homepage.grade, homepage.period, homepage.placeOrBefore]
    }
    
    func otherView(other: Other){
        let labels = ["詳細", "対象学科","対象学年","時限","場所"]
        var contents = [other.content, other.department, other.grade, other.period, other.placeOrBefore]
    }

    
}

//    func setup(){
////        titleLabel.textAlignment = NSTextAlignment.left
////        lineView.backgroundColor = UIColor.black
////        lineView.bounds = CGRect(x: 0, y: titleLabel.bounds.height, width: self.bounds.width, height: 1)
//        let view = Bundle.main.loadNibNamed("TitleView", owner: self, options: nil)?.first as! UIView
//        view.frame = self.bounds
//        view.backgroundColor = UIColor.yellow
//        self.addSubview(view)
//        self.addSubview(titleLabel)
//        self.addSubview(lineView)
//    }
    
//    convenience init(title: String, content: String){
//        self.init(frame: CGRect.zero)
//        
//        let titleLabel = UILabel()
//        titleLabel.textAlignment = NSTextAlignment.left
//        titleLabel.text = title
//        titleLabel.frame = CGRect(x: 0, y: 30, width: 200, height: 50)
//        titleLabel.backgroundColor = UIColor.black
//        
//        let lineView = UIView()
//        lineView.frame = CGRect(x: 0.0, y: titleLabel.frame.maxY, width: self.frame.width, height: 30)
//        lineView.backgroundColor = UIColor.black
//        
//        let contentLabel = UILabel()
//        contentLabel.textAlignment = NSTextAlignment.left
//        contentLabel.text = content
//        contentLabel.frame = CGRect(x: 0.0, y: lineView.frame.maxY, width: self.frame.width, height: 30)
//        contentLabel.backgroundColor = UIColor.black
//        
//        self.addSubview(titleLabel)
//        self.addSubview(lineView)
//        self.addSubview(contentLabel)
//    }}



//class NoticeView: UIView {
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
//
////    convenience init(noticeModel: Notice){
////        self.init(frame: CGRect.zero)
////        let periodView = ContentView(title: "時限", content: "１限目")
////        let placeOrBeforeView = ContentView(title: "場所/教室", content: "1202教室")
////        let contentView = ContentView(title: "内容", content: "部屋が変更になりました。")
////        let departmentView = ContentView(title: "対象学科", content: "電子情報工学科")
////        let gradeView = ContentView(title: "対象学年", content: "３年")
////
////        addSubview(periodView)
////        addSubview(placeOrBeforeView)
////        addSubview(contentView)
////        addSubview(departmentView)
////        addSubview(gradeView)
////    }
//    convenience init(){
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
//}

