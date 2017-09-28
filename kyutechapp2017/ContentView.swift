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
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
//    convenience init(model: BulletinModel, genre: Genre, num: Int){
    func setup(model: BulletinModel, genre: Genre, num: Int){
        switch genre {
        case .all: break
        case .notice:
            let notice = model.notices[num]
            let contents = [(title:"詳細", content: notice.content),(title: "対象学科", content: notice.department),(title: "対象学年", content: notice.grade), (title: "時限", content: notice.period), (title: "場所", content: notice.placeOrBefore)]
            
            makeView(contents: contents)
            
        case .lecture:
//            let lecture = model.lectures[num]
//            let lecture = [(content: "これはテストです", subject: "数学", department: "機械情報", grade: "2年", responsibility: "鈴木", placeOrBefore: "研究棟2階", after: "2001教室", note: "これは実験です")]
//            let contents = [(title:"詳細", content: lecture.content), (title: "科目", content: lecture.subject), (title: "対象学科", content: lecture.department), (title: "対象学年", content: lecture.grade), (title: "時限", content: lecture.period),(title: "担当教員/担当部署", content: lecture.responsibility), (title: "場所/教室(変更前)", content: lecture.placeOrBefore), (title: "場所/教室(変更後", content: lecture.after), (title: "備考/注記/特記/種別", content: lecture.note)]
//            var attachments = [String]() //attachment
            
            let contents = [(title:"詳細", content: "これは詳細のテストです"), (title: "科目", content: "数学"), (title: "対象学科", content: "知能情報"), (title: "対象学年", content: "２年"), (title: "時限", content: "３限"),(title: "担当教員/担当部署", content: "鈴木"), (title: "場所/教室(変更前)", content: "研究棟"), (title: "場所/教室(変更後", content: "2010"), (title: "備考/注記/特記/種別", content: "特にないよ")]
            var attachments = [String]() //attachment

            attachments.append("URLだよ")
//            for t in lecture.attachments {
////                attachments.append(t.url)
//            }
            makeViewWithAttachments(contents: contents, attachments: attachments)
            
        case .call:
            let call = model.calls[num]
            let contents = [(title: "詳細", content: call.content), (title: "対象学科", content: call.department), (title: "対象学年", content: call.grade), (title: "備考/注記/特記/種別", content: call.note)]
            
            makeView(contents: contents)

        case .intensiveLecture:
            let intensiveLecture = model.intensiveLectures[num]
            let contents = [(title: "詳細", content: intensiveLecture.content), (title: "備考/注記/特記/種別", content: intensiveLecture.note)]
            var attachments = [String]() //添付資料
            
            for t in intensiveLecture.attachments{
                attachments.append(t.url)
            }
            makeViewWithAttachments(contents: contents, attachments: attachments)
            
        case .studyAbroad:
            let studyAbroad = model.studyAbroads[num]
            let contents = [(title: "詳細", content: studyAbroad.content),(title: "担当教員/担当部署", content: studyAbroad.responsibility)]
            var attachments = [String]()//添付資料
            
            for t in studyAbroad.attachments{
                attachments.append(t.url)
            }
            makeViewWithAttachments(contents: contents, attachments: attachments)
            
        case .scholarship:
            let scholarship = model.scholarships[num]
            let contents = [(title: "詳細", content: scholarship.content),(title: "備考/注記/特記/種別", content: scholarship.note)]
            var attachments = [String]()
            
            for t in scholarship.attachments{
                attachments.append(t.url)
            }
            makeViewWithAttachments(contents: contents, attachments: attachments)
            
        case .homepage:
            let homepage = model.homepages[num]
            let contents = [(title: "詳細", content: homepage.content),(title: "備考/注記/特記/種別", content: homepage.note),(title: "場所", content: homepage.place), (title: "問い合わせ先", content: homepage.inquiry)]
            //board idは？
            makeView(contents: contents)

        case .other:
            let other = model.others[num]
            let contents = [(title: "詳細", content: other.content), (title: "備考/注記/特記/種別", content: other.note), (title: "担当教員/担当部署", content: other.responsibility)]
            var attachments = [String]()
            
            for t in other.attachments{
                attachments.append(t.url)
            }
            makeViewWithAttachments(contents: contents, attachments: attachments)
        }
    }
}



extension ContentView{
    
    /// 画面の生成をする関数　資料がない場合
    ///
    /// - Parameter contents: 内容
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
    
    
    
    
    
    
    /// 画面を生成する関数：資料がある場合
    ///
    /// - Parameters:
    ///   - contents: 内容
    ///   - attachments: 資料
    func makeViewWithAttachments(contents:[(title: String, content: String)], attachments: [String]){
        
        var height:CGFloat = 30
        let margin: CGFloat = 10 //define horizontal margin
        let leading: CGFloat = 20
        var positionY: CGFloat = 50
        
        let titleLabel = UILabel()
        titleLabel.text = contents[0].title
    
        let topLineView = UIView()
        topLineView.backgroundColor = .black
        
        let contentLabel = UILabel()
        contentLabel.text = contents[0].content
        contentLabel.numberOfLines = 0 //0は無限
//        height = CGFloat.greatestFiniteMagnitude
        
        let bottomLineView = UIView()
        bottomLineView.backgroundColor = .black
        
        self.addSubview(titleLabel)
        self.addSubview(topLineView)
        self.addSubview(contentLabel)
        self.addSubview(bottomLineView)
        
        //autolayout
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        topLineView.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomLineView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([
            
            //titleLabel
            Constraint(item: titleLabel, .top, to: self, .top, constant: 50), //top
            Constraint(item: titleLabel, .left, to: self, .left, constant: 10), //leading
            Constraint(item: titleLabel, .right, to: self, .right, constant: 10), //trailing
            Constraint(item: titleLabel, .height, to: nil, .height, constant: 100),
//            Constraint(item: titleLabel, .bottom, to: self, .bottom, constant: 10), //bottom
            //topLineView
            Constraint(item: topLineView, .top, to: titleLabel, .bottom, constant: 10), //top
            Constraint(item: topLineView, .left, to: self, .left, constant: 30), //leading
            Constraint(item: topLineView, .right, to: self, .right, constant: 30), //height
//            Constraint(item: topLineView, .bottom, to: self, .bottom, constant: 20), //width
            
            //contentLabel
            Constraint(item: contentLabel, .top, to: topLineView, .bottom, constant: 10), //top
            Constraint(item: contentLabel, .left, to: self, .left, constant: 30), //leading
            Constraint(item: contentLabel, .right, to: self, .right, constant: 30), //height
//            Constraint(item: contentLabel, .bottom, to: self, .bottom, constant: 20), // width
            
            //bottomLineView
            Constraint(item: bottomLineView, .top, to: contentLabel, .bottom, constant: 10), //top
            Constraint(item: bottomLineView, .left, to: self, .left, constant: 30), //leading
            Constraint(item: bottomLineView, .right, to: self, .right, constant: 30), //height
            Constraint(item: bottomLineView, .bottom, to: self, .bottom, constant: 20)
            
            ])
        
        
        let count = contents.count
        var num = 2
        
//        for content in contents{
////            let title = UILabel()
////            let content = UILabel()
////
//            let titleLabel = UILabel()
//            titleLabel.text = content.title
//            
//            let topLineView = UIView()
//            topLineView.backgroundColor = .black
//            
//            let contentLabel = UILabel()
//            contentLabel.text = content.content
//            contentLabel.numberOfLines = 0 //0は無限
//            height = CGFloat.greatestFiniteMagnitude
//            
//            let bottomLineView = UIView()
//            bottomLineView.backgroundColor = .black
//            
//            self.addSubview(titleLabel)
//            self.addSubview(topLineView)
//            self.addSubview(contentLabel)
//            self.addSubview(bottomLineView)
//            
//            //autolayout
//            titleLabel.translatesAutoresizingMaskIntoConstraints = false
//            topLineView.translatesAutoresizingMaskIntoConstraints = false
//            contentLabel.translatesAutoresizingMaskIntoConstraints = false
//            bottomLineView.translatesAutoresizingMaskIntoConstraints = false
//            
//            self.addConstraints([
//                
//                //titleLabel
//                Constraint(item: titleLabel, .top, to: bottomLineView, .bottom, constant: 10), //top
//                Constraint(item: titleLabel, .leading, to: self, .leading, constant: 30), //leading
//                Constraint(item: titleLabel, .trailing, to: self, .trailing, constant: 30), //height
////                Constraint(item: titleLabel, .bottom, to: self, .bottom, constant: 20), //width
//                //topLineView
//                Constraint(item: topLineView, .top, to: titleLabel, .bottom, constant: 10), //top
//                Constraint(item: topLineView, .leading, to: self, .leading, constant: 30), //leading
//                Constraint(item: topLineView, .trailing, to: self, .trailing, constant: 30), //height
////                Constraint(item: topLineView, .bottom, to: self, .bottom, constant: 20), //width
//                
//                //contentLabel
//                Constraint(item: contentLabel, .top, to: topLineView, .bottom, constant: 10), //top
//                Constraint(item: contentLabel, .leading, to: self, .leading, constant: 30), //leading
//                Constraint(item: contentLabel, .trailing, to: self, .trailing, constant: 30), //height
////                Constraint(item: contentLabel, .bottom, to: self, .bottom, constant: 20), // width
//                
//                //bottomLineView
//                Constraint(item: bottomLineView, .top, to: contentLabel, .bottom, constant: 10), //top
//                Constraint(item: bottomLineView, .leading, to: self, .leading, constant: 30), //leading
//                Constraint(item: bottomLineView, .trailing, to: self, .trailing, constant: 30), //height
////                Constraint(item: bottomLineView, .bottom, to: self, .bottom, multiplier: 20) //width
//                
//                ])
//            
//
////            title.text = "これはタイトルのテストです。" + "\(num)"
//////                contents[num].title
////            content.text = "これはfor文のテストです"
//////                contents[num].content
////            
////            height = 30
////            
////
////            height = CGFloat.greatestFiniteMagnitude
////
////            
////            positionY = positionY + height + margin //update position Y
////            
////            self.addSubview(title)
////            self.addSubview(content)
////            
////            //autolayout
////            title.translatesAutoresizingMaskIntoConstraints = false
////            content.translatesAutoresizingMaskIntoConstraints = false
////
////            
////            
////            
////            num += 1
////            if num > count{ break }
//        }
        
//        self.addConstraint(
//            Constraint(item: bottomLineView, .bottom, to: self, .bottom, constant: 30)
//        )
//
//        height = 30
//        
//        let aTitle = UILabel()
//        aTitle.translatesAutoresizingMaskIntoConstraints = false
//        aTitle.text = "添付資料"
//        aTitle.frame = CGRect(x: 20 , y: positionY, width: self.frame.width * 0.22, height: height)
//        
//        self.addSubview(aTitle)
//        
//        for i in attachments {
//            let label = UILabel()
//            
//            label.textColor = UIColor.blue
//            label.text = i
//            height = CGFloat.greatestFiniteMagnitude
//            label.frame = CGRect(x: 20  + self.frame.width * 0.30, y: positionY, width: self.frame.width * 0.54, height: height)
//            
//            positionY = positionY + height + margin // update position Y
//            
//            self.addSubview(label)
//        }
    }
}



/// 制約(NSLayoutConstraint)を生成する
/// - parameter item: 制約を追加するオブジェクト
/// - parameter attr: 制約を追加するオブジェクトに与える属性
/// - parameter to: 制約の相手
/// - parameter attrTo: 制約相手に使用する属性
/// - parameter constant: 定数値
/// - parameter multiplier: 乗数値
/// - parameter relate: 計算式の関係性
/// - parameter priority: 制約の優先度
/// - returns: 制約(NSLayoutConstraint)オブジェクト
public func Constraint(item: AnyObject, _ attr: NSLayoutAttribute, to: AnyObject?, _ attrTo: NSLayoutAttribute, constant: CGFloat = 0.0, multiplier: CGFloat = 1.0, relate: NSLayoutRelation = .equal, priority: UILayoutPriority = UILayoutPriorityRequired) -> NSLayoutConstraint {
    let ret = NSLayoutConstraint(
        item:       item,
        attribute:  attr,
        relatedBy:  relate,
        toItem:     to,
        attribute:  attrTo,
        multiplier: multiplier,
        constant:   constant
    )
    ret.priority = priority
    return ret
}

