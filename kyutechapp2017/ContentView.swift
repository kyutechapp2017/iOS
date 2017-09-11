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
    }
    
    convenience init(model: BulletinModel, genre: Genre, num: Int){
        self.init(frame: CGRect.zero)
        switch genre {
        case .all: break
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
    }
}



extension ContentView{
    
    func noticeView(notice: Notice){
        
        let contents = [(title:"詳細", content: notice.content),(title: "対象学科", content: notice.department),(title: "対象学年", content: notice.grade), (title: "時限", content: notice.period), (title: "場所", content: notice.placeOrBefore)]
        
        makeView(contents: contents)
    }
    
    
    func lectureView(lecture: Lecture){
        
        let contents = [(title:"詳細", content: lecture.content), (title: "科目", content: lecture.subject), (title: "対象学科", content: lecture.department), (title: "対象学年", content: lecture.grade), (title: "時限", content: lecture.period),(title: "担当教員/担当部署", content: lecture.responsibility), (title: "場所/教室(変更前)", content: lecture.placeOrBefore), (title: "場所/教室(変更後", content: lecture.after), (title: "備考/注記/特記/種別", content: lecture.note)]
    
        var attachments = [String]() //attachment
        for t in lecture.attachments {
            attachments.append(t.url)
        }

        makeViewWithAttachments(contents: contents, attachments: attachments)
    }

    
    func callView(call: Call){
        
        let contents = [(title: "詳細", content: call.content), (title: "対象学科", content: call.department), (title: "対象学年", content: call.grade), (title: "備考/注記/特記/種別", content: call.note), (title: "期日", content: call.finish)]
        
        makeView(contents: contents)
    }

    func intensiveLectureView(intensiveLecture: IntensiveLecture){
        
        let contents = [(title: "詳細", content: intensiveLecture.content), (title: "備考/注記/特記/種別", content: intensiveLecture.note)]
        //添付資料
        var attachments = [String]()
        for t in intensiveLecture.attachments{
            attachments.append(t.url)
        }
        
        makeViewWithAttachments(contents: contents, attachments: attachments)
    }
    
    
    func studyAbroadView(studyAbroad: StudyAbroad){
        let contents = [(title: "詳細", content: studyAbroad.content),(title: "担当教員/担当部署", content: studyAbroad.responsibility)]
        
        //添付資料
        var attachments = [String]()
        for t in studyAbroad.attachments{
            attachments.append(t.url)
        }
        
        makeViewWithAttachments(contents: contents, attachments: attachments)
    }
    
    
    func scholarshipView(scholarship: Scholarship){
        
        let contents = [(title: "詳細", content: scholarship.content),(title: "備考/注記/特記/種別", content: scholarship.note)]
       
        var attachments = [String]()
        for t in scholarship.attachments{
            attachments.append(t.url)
        }
        
        makeViewWithAttachments(contents: contents, attachments: attachments)
    }
    
    func homepageView(homepage: Homepage){

        let contents = [(title: "詳細", content: homepage.content),(title: "備考/注記/特記/種別", content: homepage.note),(title: "場所", content: homepage.place), (title: "問い合わせ先", content: homepage.inquiry)]
        //board idは？
        
        makeView(contents: contents)
    }
    
    
    func otherView(other: Other){
        let contents = [(title: "詳細", content: other.content), (title: "備考/注記/特記/種別", content: other.note), (title: "担当教員/担当部署", content: other.responsibility)]
        
        var attachments = [String]()
        for t in other.attachments{
            attachments.append(t.url)
        }
        
        makeViewWithAttachments(contents: contents, attachments: attachments)
    }
}



extension ContentView{
    
    func makeView(contents:[(title: String, content: String)]){
        
        var height:CGFloat = 30
        let margin: CGFloat = 10 //define horizontal margin
        let lineHeight: CGFloat =  1 //define lineView's height
        let positionX: CGFloat = self.frame.width * 0.08
        var positionY: CGFloat = 50
        
        let titleLabel = UILabel()
        titleLabel.text = contents[0].title
        titleLabel.frame = CGRect(x: positionX, y: positionY, width: self.frame.width * 0.84, height: height)
        
        positionY = positionY + height + margin //update position Y
        
        let topLineView = UIView()
        topLineView.frame = CGRect(x: positionX, y: positionY, width: self.frame.width * 0.84, height: lineHeight)
        
        positionY = positionY + lineHeight + margin //update position Y
        
        let contentLabel = UILabel()
        contentLabel.text = contents[0].content
        contentLabel.numberOfLines = 0 //0は無限
        height = CGFloat.greatestFiniteMagnitude
        contentLabel.frame = CGRect(x: positionX, y: positionY, width: self.frame.width * 0.84, height: height)
        
        positionY = positionY + height + margin //update position Y
        
        let bottomLineView = UIView()
        bottomLineView.frame = CGRect(x: positionX , y: positionY, width: self.frame.width * 0.84, height: lineHeight)
        
        positionY = positionY + lineHeight + margin //update position Y
        
        self.addSubview(titleLabel)
        self.addSubview(topLineView)
        self.addSubview(contentLabel)
        self.addSubview(bottomLineView)
        
        let count = contents.count
        var num = 2
        
        for _ in 2 ... count{
            let title = UILabel()
            let content = UILabel()
            
            title.text = contents[num].title
            content.text = contents[num].content
            
            height = 30
            title.frame = CGRect(x: positionX, y: positionY, width: self.frame.width * 0.22, height: height)
            height = CGFloat.greatestFiniteMagnitude
            content.frame = CGRect(x: positionX + self.frame.width * 0.30, y: positionY, width: self.frame.width * 0.54, height: height)
            
            positionY = positionY + height + margin //update position Y
            
            self.addSubview(title)
            self.addSubview(content)
            
            num += 1
            if num > count{ break }
        }
    }
    
    
    
    func makeViewWithAttachments(contents:[(title: String, content: String)], attachments: [String]){
        
        
        var height:CGFloat = 30
        let margin: CGFloat = 10 //define horizontal margin
        let lineHeight: CGFloat =  1 //define lineView's height
        let positionX: CGFloat = self.frame.width * 0.08
        var positionY: CGFloat = 50
        
        let titleLabel = UILabel()
        titleLabel.text = contents[0].title
        titleLabel.frame = CGRect(x: positionX, y: positionY, width: self.frame.width * 0.84, height: height)
        
        positionY = positionY + height + margin //update position Y
        
        let topLineView = UIView()
        topLineView.frame = CGRect(x: positionX, y: positionY, width: self.frame.width * 0.84, height: lineHeight)
        
        positionY = positionY + lineHeight + margin //update position Y
        
        let contentLabel = UILabel()
        contentLabel.text = contents[0].content
        contentLabel.numberOfLines = 0 //0は無限
        height = CGFloat.greatestFiniteMagnitude
        contentLabel.frame = CGRect(x: positionX, y: positionY, width: self.frame.width * 0.84, height: height)
        
        positionY = positionY + height + margin //update position Y
        
        let bottomLineView = UIView()
        bottomLineView.frame = CGRect(x: positionX , y: positionY, width: self.frame.width * 0.84, height: lineHeight)
        
        positionY = positionY + lineHeight + margin //update position Y
        
        self.addSubview(titleLabel)
        self.addSubview(topLineView)
        self.addSubview(contentLabel)
        self.addSubview(bottomLineView)
        
        let count = contents.count
        var num = 2
        
        for _ in 2 ... count{
            let title = UILabel()
            let content = UILabel()
            
            title.text = contents[num].title
            content.text = contents[num].content
            
            height = 30
            title.frame = CGRect(x: positionX, y: positionY, width: self.frame.width * 0.22, height: height)
            height = CGFloat.greatestFiniteMagnitude
            content.frame = CGRect(x: positionX + self.frame.width * 0.30, y: positionY, width: self.frame.width * 0.54, height: height)
            
            positionY = positionY + height + margin //update position Y
            
            self.addSubview(title)
            self.addSubview(content)
            
            num += 1
            if num > count{ break }
        }
        
        height = 30
        
        let aTitle = UILabel()
        aTitle.text = "添付資料"
        aTitle.frame = CGRect(x: positionX , y: positionY, width: self.frame.width * 0.22, height: height)
        
        self.addSubview(aTitle)
        
        for i in attachments {
            let label = UILabel()
            
            label.textColor = UIColor.blue
            label.text = i
            height = CGFloat.greatestFiniteMagnitude
            label.frame = CGRect(x: positionX + self.frame.width * 0.30, y: positionY, width: self.frame.width * 0.54, height: height)
            
            positionY = positionY + height + margin // update position Y
            
            self.addSubview(label)
        }
    }
}
