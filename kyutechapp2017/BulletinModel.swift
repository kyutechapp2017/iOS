//
//  BulletinModel.swift
//  kyutechapp2017
//
//  Created by 山浦功 on 2017/04/17.
//  Copyright © 2017年 塩田宰. All rights reserved.
//

import UIKit
import Alamofire

class BulletinModel{
    static let sharedInstance = BulletinModel()
    private init(){}
    
    var notices = [Notice]()
    var lectures = [Lecture]()
    var calls = [Call]()
    var intensiveLectures = [IntensiveLecture]()
    var studyAbroads = [StudyAbroad]()
    var scholarships = [Scholarship]()
    var homepages = [Homepage]()
    var others = [Other]()
    
    
    
    func getNotice(genre: Genre, update: Double){
        APIService.getBoardInfo(genre: genre, update: update, handler: { (json) in
            let array = json.arrayValue
            
            switch genre{
            case .all: break
            case .notice: BulletinModel.sharedInstance.notices =  array.map{ Notice(json: $0) }
            case .lecture: BulletinModel.sharedInstance.lectures =  array.map{ Lecture(json: $0) }
            case .call: BulletinModel.sharedInstance.calls = array.map{ Call(json: $0)}
            case .intensiveLecture: BulletinModel.sharedInstance.intensiveLectures = array.map{ IntensiveLecture(json: $0)}
            case .studyAbroad: BulletinModel.sharedInstance.studyAbroads = array.map{ StudyAbroad(json: $0)}
            case .scholarship: BulletinModel.sharedInstance.scholarships = array.map{ Scholarship(json: $0)}
            case .homepage: BulletinModel.sharedInstance.homepages = array.map{ Homepage(json: $0)}
            case .other: BulletinModel.sharedInstance.others = array.map{ Other(json: $0)}
            }
            
        })
    }
    
    func getTitle(genre: Genre, model: BulletinModel, num: Int) -> String{
        var title = ""
        switch genre{
        case .all: break
        case .notice: title =  model.notices[num].title
        case .lecture: title =  model.lectures[num].title
        case .call: title = model.calls[num].title
        case .intensiveLecture: title = model.intensiveLectures[num].title
        case .studyAbroad: title = model.studyAbroads[num].title
        case .scholarship: title = model.scholarships[num].title
        case .homepage: title = model.homepages[num].title
        case .other: title = model.others[num].title
        }
        return title
    }
    
    func getDate(genre: Genre, model: BulletinModel, num: Int) -> String{
        var date = ""
        switch genre{
        case .all: break
        case .notice: date =  DateUtils.stringFromDate(date: model.notices[num].date, format: "yyyy.mm.dd")
        case .lecture: date =  DateUtils.stringFromDate(date: model.lectures[num].date, format: "yyyy.mm.dd")
        case .call: date =  DateUtils.stringFromDate(date: model.calls[num].date, format: "yyyy.mm.dd")
        case .intensiveLecture: date =  DateUtils.stringFromDate(date: model.intensiveLectures[num].date, format: "yyyy.mm.dd")
        case .studyAbroad: date =  DateUtils.stringFromDate(date: model.studyAbroads[num].date, format: "yyyy.mm.dd")
        case .scholarship: date =  DateUtils.stringFromDate(date: model.scholarships[num].date, format: "yyyy.mm.dd")
        case .homepage: date =  DateUtils.stringFromDate(date: model.homepages[num].date, format: "yyyy.mm.dd")
        case .other: date =  DateUtils.stringFromDate(date: model.others[num].date, format: "yyyy.mm.dd")
        }
        return date
    }
}



enum Genre: Int {
    case all, notice, lecture, call, intensiveLecture, studyAbroad, scholarship, homepage, other
}




class DateUtils {
    class func dateFromString(string: String, format: String) -> NSDate {
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = format
        return formatter.date(from: string)! as NSDate
    }
    
    class func stringFromDate(date: NSDate, format: String) -> String {
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = format
        return formatter.string(from: date as Date)
    }
}
