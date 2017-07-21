//
//  BulletinRealm.swift
//  kyutechapp2017
//
//  Created by 山浦功 on 2017/04/17.
//  Copyright © 2017年 塩田宰. All rights reserved.
//

import UIKit
import Foundation
import RealmSwift
import SwiftyJSON


class Attachment: Object {
    dynamic var url = ""
    
    convenience init(url: String){
        self.init()
        self.url = url
    }
}



class BoardInfo: Object{
    dynamic var id: Int = 0
    dynamic var url: String = ""
    
    dynamic var title: String = ""
    dynamic var date = NSDate()
    dynamic var content: String = ""
    
    override static func primaryKey() -> String { return "id" }

    convenience init(json: JSON) {
        self.init()
        self.id                 = json["id"].intValue
        self.url                = json["url"].stringValue
        self.title              = json["title"].stringValue
        let unixtime = json["date"].intValue
        self.date = NSDate.init(timeIntervalSince1970: TimeInterval(unixtime))
        self.content            = json["content"].stringValue
    }
    
    
    
}

class Notice: BoardInfo{
    dynamic var period: String = ""
    dynamic var placeOrBefore: String = ""
    dynamic var department: String = ""
    dynamic var grade: String = ""
    let attachments = List<Attachment>()
    
    convenience init(json: JSON){
        self.init(json: json)
        self.period = json["period"].stringValue
        self.placeOrBefore = json["place_or_before"].stringValue
        self.department = json["department"].stringValue
        self.grade = json["grade"].stringValue
        let attachmentsJson = json["attachment"].arrayValue
        _ = attachmentsJson.map{self.attachments.append(Attachment(url: $0["hogehoge"].stringValue))}
    }
}

class Lecture: BoardInfo{
    dynamic var boardId: Int = 0
    dynamic var subject: String = ""
    dynamic var period: String = ""
    dynamic var placeOrBefore: String = ""
    dynamic var after: String = ""
    dynamic var department: String = ""
    dynamic var grade: String = ""
    dynamic var note: String = ""
    let attachments = List<Attachment>()
    
    convenience init(json: JSON){
        self.init(json: json)
        self.boardId = json["boardId"].intValue
        self.subject = json["subject"].stringValue
        self.period = json["period"].stringValue
        self.placeOrBefore = json["placeOrBefore"].stringValue
        self.after = json["after"].stringValue
        self.department = json["department"].stringValue
        self.grade = json["grade"].stringValue
        self.note = json["note"].stringValue
        let attachmentsJson = json["attachment"].arrayValue
        _ = attachmentsJson.map{ self.attachments.append(Attachment(url: $0["hogehoge"].stringValue)) }
    }
}

class Call: BoardInfo{
    dynamic var department: String = ""
    dynamic var grade: String = ""
    dynamic var note: String = ""
    dynamic var finish: String = ""
    
    convenience init(json: JSON){
        self.init(json: json)
        self.department = json["department"].stringValue
        self.grade = json["grade"].stringValue
        self.note = json["note"].stringValue
        self.finish = json["finish"].stringValue
    }
    
}

class IntensiveLecture: BoardInfo{
    dynamic var note: String = ""
    
    convenience init(json: JSON){
        self.init(json: json)
        self.note = json["note"].stringValue
    }
}

class StudyAbroad: BoardInfo{
    dynamic var responsibility: String = ""
    let attachments = List<Attachment>()
    
    convenience init(json: JSON){
        self.init(json: json)
        self.responsibility = json["responsibility"].stringValue
        let attachmentsJson = json["attachment"].arrayValue
        _ = attachmentsJson.map{ self.attachments.append(Attachment(url: $0["hogehoge"].stringValue)) }
    }
}

class Scholarship: BoardInfo{
    dynamic var note: String = ""
    dynamic var finish: String = ""
    let attachments = List<Attachment>()
    
    convenience init(json: JSON){
        self.init(json: json)
        self.note = json["note"].stringValue
        self.finish = json["finish"].stringValue
        let attachmentsJson = json["attachment"].arrayValue
        _ = attachmentsJson.map{ self.attachments.append(Attachment(url: $0["hogehoge"].stringValue)) }
    }
}

class Homepage: BoardInfo{
    dynamic var boardId: Int = 0
    dynamic var place: String = ""
    dynamic var note: String = ""
    dynamic var inquiry: String = ""
    
    convenience init(json: JSON){
        self.init(json: json)
        self.boardId = json["boardId"].intValue
        self.place = json["place"].stringValue
        self.note = json["note"].stringValue
        self.inquiry = json["inquiry"].stringValue
    }
}
