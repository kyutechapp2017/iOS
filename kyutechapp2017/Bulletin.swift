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
//class IizukaNotice: Object{
//    private dynamic var id: Int = 0
//    private dynamic var url: String = ""
//    
//    dynamic var title: String = ""
//    dynamic var date = NSDate()
//    dynamic var period: String = ""
//    dynamic var place_or_before: String = ""
//    dynamic var content: String = ""
//    dynamic var department: String = ""
//    dynamic var grade: String = ""
//    dynamic var attachment_1: String = ""
//    dynamic var attachment_1_url: String = ""
//    dynamic var attachment_2: String = ""
//    dynamic var attachment_2_url: String = ""
//    dynamic var attachment_3: String = ""
//    dynamic var attachment_3_url: String = ""
//    dynamic var attachment_4: String = ""
//    dynamic var attachment_4_url: String = ""
//    dynamic var attachment_5: String = ""
//    dynamic var attachment_5_url: String = ""
//    
//    
//    override static func primaryKey() -> String { return "id" }
//    
//    convenience init(json: SwiftyJSON.JSON){
//        self.init()
//        self.id                 = json["id"].intValue
//        self.url                = json["url"].stringValue
//        self.title              = json["title"].stringValue
////        self.date = json["date"].
//        self.period             = json["period"].stringValue
//        self.place_or_before    = json["place_or_before"].stringValue
//        self.content            = json["content"].stringValue
//        self.department         = json["department"].stringValue
//        self.grade              = json["grade"].stringValue
//        self.attachment_1       = json["attachment_1"].stringValue
//        self.attachment_1_url   = json["attachment_1_url"].stringValue
//        self.attachment_2       = json["attachment_2"].stringValue
//        self.attachment_2_url   = json["attachment_2_url"].stringValue
//        self.attachment_3       = json["attachment_3"].stringValue
//        self.attachment_3_url   = json["attachment_3_url"].stringValue
//        self.attachment_4       = json["attachment_4"].stringValue
//        self.attachment_4_url   = json["attachment_4_url"].stringValue
//        self.attachment_5       = json["attachment_5"].stringValue
//        self.attachment_5_url   = json["attachment_5_url"].stringValue
//    }
//}


//class IizukaLecture: Object{
//    private dynamic var id: Int = 0
//    private dynamic var url: String = ""
//    private var board_id: Int = 0
//    
//    dynamic var title: String = ""
//    dynamic var subject: String = ""
//    dynamic var date = NSDate()
//    dynamic var period: String = ""
//    dynamic var responsibility: String = ""
//    dynamic var place_or_before: String = ""
//    dynamic var after: String = ""
//    dynamic var content: String = ""
//    dynamic var department: String = ""
//    dynamic var grade: String = ""
//    dynamic var note: String = ""
//    dynamic var attachment_1: String = ""
//    dynamic var attachment_1_url: String = ""
//    dynamic var attachment_2: String = ""
//    dynamic var attachment_2_url: String = ""
//    dynamic var attachment_3: String = ""
//    dynamic var attachment_3_url: String = ""
//    dynamic var attachment_4: String = ""
//    dynamic var attachment_4_url: String = ""
//    dynamic var attachment_5: String = ""
//    dynamic var attachment_5_url: String = ""
//    
//    override static func primaryKey() -> String { return "id" }
//    
//    convenience init(json: SwiftyJSON.JSON){
//        self.init()
//        self.id                 = json["id"].intValue
//        self.url                = json["url"].stringValue
//        self.board_id           = json["board_id"].intValue
//        
//        self.title              = json["title"].stringValue
//        self.subject            = json["subject"].stringValue
//        //        self.date = json["date"].
//        self.period             = json["period"].stringValue
//        self.responsibility     = json["responsibility"].stringValue
//        self.place_or_before    = json["place_or_before"].stringValue
//        self.after              = json["after"].stringValue
//        self.content            = json["content"].stringValue
//        self.department         = json["department"].stringValue
//        self.grade              = json["grade"].stringValue
//        self.note               = json["note"].stringValue
//        self.attachment_1       = json["attachment_1"].stringValue
//        self.attachment_1_url   = json["attachment_1_url"].stringValue
//        self.attachment_2       = json["attachment_2"].stringValue
//        self.attachment_2_url   = json["attachment_2_url"].stringValue
//        self.attachment_3       = json["attachment_3"].stringValue
//        self.attachment_3_url   = json["attachment_3_url"].stringValue
//        self.attachment_4       = json["attachment_4"].stringValue
//        self.attachment_4_url   = json["attachment_4_url"].stringValue
//        self.attachment_5       = json["attachment_5"].stringValue
//        self.attachment_5_url   = json["attachment_5_url"].stringValue
//    }
//}
//
//
//
//class IizukaCall: Object {
//    private dynamic var id: Int = 0
//    private dynamic var url: String = ""
//    
//    dynamic var title: String = ""
//    dynamic var date =  NSDate()
//    dynamic var content: String = ""
//    dynamic var department: String = ""
//    dynamic var grade: String = ""
//    dynamic var note: String = ""
//    dynamic var finish: String = ""
//    
//    override static func primaryKey() -> String { return "id" }
//    
//    convenience init(json: SwiftyJSON.JSON){
//        self.init()
//        self.id                 = json["id"].intValue
//        self.url                = json["url"].stringValue
//        
//        self.title              = json["title"].stringValue
//        //        self.date = json["date"].
//        self.content            = json["content"].stringValue
//        self.department         = json["department"].stringValue
//        self.grade              = json["grade"].stringValue
//        self.note               = json["note"].stringValue
//    }
//}
//
//
//
//class IizukaIntensiveLecture: Object {
//    private dynamic var id: Int = 0
//    private dynamic var url: String = ""
//    
//    dynamic var title: String = ""
//    dynamic var date =  NSDate()
//    dynamic var content: String = ""
//    dynamic var note: String = ""
//    dynamic var attachment_1: String = ""
//    dynamic var attachment_1_url: String = ""
//    dynamic var attachment_2: String = ""
//    dynamic var attachment_2_url: String = ""
//    dynamic var attachment_3: String = ""
//    dynamic var attachment_3_url: String = ""
//    dynamic var attachment_4: String = ""
//    dynamic var attachment_4_url: String = ""
//    dynamic var attachment_5: String = ""
//    dynamic var attachment_5_url: String = ""
//    
//    override static func primaryKey() -> String { return "id" }
//    
//    convenience init(json: SwiftyJSON.JSON){
//        self.init()
//        self.id                 = json["id"].intValue
//        self.url                = json["url"].stringValue
//        
//        self.title              = json["title"].stringValue
//        //        self.date = json["date"].
//        self.content            = json["content"].stringValue
//        self.note               = json["note"].stringValue
//        self.attachment_1       = json["attachment_1"].stringValue
//        self.attachment_1_url   = json["attachment_1_url"].stringValue
//        self.attachment_2       = json["attachment_2"].stringValue
//        self.attachment_2_url   = json["attachment_2_url"].stringValue
//        self.attachment_3       = json["attachment_3"].stringValue
//        self.attachment_3_url   = json["attachment_3_url"].stringValue
//        self.attachment_4       = json["attachment_4"].stringValue
//        self.attachment_4_url   = json["attachment_4_url"].stringValue
//        self.attachment_5       = json["attachment_5"].stringValue
//        self.attachment_5_url   = json["attachment_5_url"].stringValue
//    }
//}
//
//
//class IizukaStudyingAbroad: Object{
//    private dynamic var id: Int = 0
//    private dynamic var url: String = ""
//    
//    dynamic var title: String = ""
//    dynamic var date = NSDate()
//    dynamic var responsivility: String = ""
//    dynamic var content: String = ""
//    dynamic var attachment_1: String = ""
//    dynamic var attachment_1_url: String = ""
//    dynamic var attachment_2: String = ""
//    dynamic var attachment_2_url: String = ""
//    dynamic var attachment_3: String = ""
//    dynamic var attachment_3_url: String = ""
//    dynamic var attachment_4: String = ""
//    dynamic var attachment_4_url: String = ""
//    
//    override static func primaryKey() -> String { return "id" }
//    
//    convenience init(json: SwiftyJSON.JSON){
//        self.init()
//        self.id                 = json["id"].intValue
//        self.url                = json["url"].stringValue
//        
//        self.title              = json["title"].stringValue
//        //        self.date = json["date"].
//        self.responsivility     = json["responsibility"].stringValue
//        self.content            = json["content"].stringValue
//        self.attachment_1       = json["attachment_1"].stringValue
//        self.attachment_1_url   = json["attachment_1_url"].stringValue
//        self.attachment_2       = json["attachment_2"].stringValue
//        self.attachment_2_url   = json["attachment_2_url"].stringValue
//        self.attachment_3       = json["attachment_3"].stringValue
//        self.attachment_3_url   = json["attachment_3_url"].stringValue
//        self.attachment_4       = json["attachment_4"].stringValue
//        self.attachment_4_url   = json["attachment_4_url"].stringValue
//    }
//}
//
//
//
//class IizukaScholarship: Object{
//    private dynamic var id: Int = 0
//    private dynamic var url: String = ""
//    
//    dynamic var title: String = ""
//    dynamic var date = NSDate()
//    dynamic var content: String = ""
//    dynamic var note: String = ""
//    dynamic var attachment_1: String = ""
//    dynamic var attachment_1_url: String = ""
//    dynamic var attachment_2: String = ""
//    dynamic var attachment_2_url: String = ""
//    dynamic var attachment_3: String = ""
//    dynamic var attachment_3_url: String = ""
//    dynamic var finish: String = ""
//    
//    override static func primaryKey() -> String { return "id" }
//    
//    convenience init(json: SwiftyJSON.JSON){
//        self.init()
//        self.id                 = json["id"].intValue
//        self.url                = json["url"].stringValue
//        
//        self.title              = json["title"].stringValue
//        //        self.date = json["date"].
//        self.content            = json["content"].stringValue
//        self.attachment_1       = json["attachment_1"].stringValue
//        self.attachment_1_url   = json["attachment_1_url"].stringValue
//        self.attachment_2       = json["attachment_2"].stringValue
//        self.attachment_2_url   = json["attachment_2_url"].stringValue
//        self.attachment_3       = json["attachment_3"].stringValue
//        self.attachment_3_url   = json["attachment_3_url"].stringValue
//        self.finish             = json["finish"].stringValue
//    }
//}
//
//
//class IizukaOther: Object{
//    private dynamic var id:Int = 0
//    private dynamic var url: String = ""
//    
//    private dynamic var board_id: Int = 0
//    dynamic var title: String = ""
//    dynamic var date =  NSDate()
//    dynamic var responsibility: String = ""
//    dynamic var content: String = ""
//    dynamic var note: String = ""
//    dynamic var attachment_1: String = ""
//    dynamic var attachment_1_url: String = ""
//    dynamic var attachment_2: String = ""
//    dynamic var attachment_2_url: String = ""
//    dynamic var attachment_3: String = ""
//    dynamic var attachment_3_url: String = ""
//    dynamic var attachment_4: String = ""
//    dynamic var attachment_4_url: String = ""
//    dynamic var attachment_5: String = ""
//    dynamic var attachment_5_url: String = ""
//    
//    override static func primaryKey() -> String { return "id" }
//    
//    convenience init(json: SwiftyJSON.JSON){
//        self.init()
//        self.id                 = json["id"].intValue
//        self.url                = json["url"].stringValue
//        
//        self.board_id           = json["board_id"].intValue
//        self.title              = json["title"].stringValue
//        //        self.date = json["date"].
//        self.responsibility     = json["responsibility"].stringValue
//        self.content            = json["content"].stringValue
//        self.note               = json["note"].stringValue
//        self.attachment_1       = json["attachment_1"].stringValue
//        self.attachment_1_url   = json["attachment_1_url"].stringValue
//        self.attachment_2       = json["attachment_2"].stringValue
//        self.attachment_2_url   = json["attachment_2_url"].stringValue
//        self.attachment_3       = json["attachment_3"].stringValue
//        self.attachment_3_url   = json["attachment_3_url"].stringValue
//        self.attachment_4       = json["attachment_4"].stringValue
//        self.attachment_4_url   = json["attachment_4_url"].stringValue
//        self.attachment_5       = json["attachment_5"].stringValue
//        self.attachment_5_url   = json["attachment_5_url"].stringValue
//    }
//}
//
//
//class IizukaHomepage: Object{
//    private dynamic var id: Int = 0
//    private dynamic var url: String = ""
//    
//    private dynamic var board_id: Int = 0
//    dynamic var date =  NSDate()
//    dynamic var place: String = ""
//    dynamic var content: String = ""
//    dynamic var note: String = ""
//    dynamic var inquiry: String = ""
//    
//    override static func primaryKey() -> String { return  "id" }
//    
//    convenience init(json: SwiftyJSON.JSON){
//        self.init()
//        self.id                 = json["id"].intValue
//        self.url                = json["url"].stringValue
//        
//        self.board_id           = json["board_id"].intValue
//        //        self.date = json["date"].
//        self.place              = json["place"].stringValue
//        self.content            = json["content"].stringValue
//        self.note               = json["note"].stringValue
//        self.inquiry            = json["inquiry"].stringValue
//    }
//}
