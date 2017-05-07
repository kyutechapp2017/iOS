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


class IizukaNotice: Object{
    private dynamic var id: Int = 0
    private dynamic var url: String = ""
    
    dynamic var title: String = ""
    dynamic var date = NSDate()
    dynamic var period: String = ""
    dynamic var place_or_before: String = ""
    dynamic var content: String = ""
    dynamic var department: String = ""
    dynamic var grade: String = ""
    dynamic var attachment_1: String = ""
    dynamic var attachment_1_url: String = ""
    dynamic var attachment_2: String = ""
    dynamic var attachment_2_url: String = ""
    dynamic var attachment_3: String = ""
    dynamic var attachment_3_url: String = ""
    dynamic var attachment_4: String = ""
    dynamic var attachment_4_url: String = ""
    dynamic var attachment_5: String = ""
    dynamic var attachment_5_url: String = ""
    
    
    override static func primaryKey() -> String { return "id" }
    
    convenience init(json: SwiftyJSON.JSON){
        self.init()
        self.id                 = json["id"].intValue
        self.url                = json["url"].stringValue
        self.title              = json["title"].stringValue
//        self.date = json["date"].
        self.period             = json["period"].stringValue
        self.place_or_before    = json["place_or_before"].stringValue
        self.content            = json["content"].stringValue
        self.department         = json["department"].stringValue
        self.grade              = json["grade"].stringValue
        self.attachment_1       = json["attachment_1"].stringValue
        self.attachment_1_url   = json["attachment_1_url"].stringValue
        self.attachment_2       = json["attachment_2"].stringValue
        self.attachment_2_url   = json["attachment_2_url"].stringValue
        self.attachment_3       = json["attachment_3"].stringValue
        self.attachment_3_url   = json["attachment_3_url"].stringValue
        self.attachment_4       = json["attachment_4"].stringValue
        self.attachment_4_url   = json["attachment_4_url"].stringValue
        self.attachment_5       = json["attachment_5"].stringValue
        self.attachment_5_url   = json["attachment_5_url"].stringValue
    }
}



class IizukaLecture: Object{
    private dynamic var id: Int = 0
    private dynamic var url: String = ""
    private var board_id: Int = 0
    
    dynamic var title: String = ""
    dynamic var subject: String = ""
    dynamic var date = NSDate()
    dynamic var period: String = ""
    dynamic var responsibility: String = ""
    dynamic var place_or_before: String = ""
    dynamic var after: String = ""
    dynamic var content: String = ""
    dynamic var department: String = ""
    dynamic var grade: String = ""
    dynamic var note: String = ""
    dynamic var attachment_1: String = ""
    dynamic var attachment_1_url: String = ""
    dynamic var attachment_2: String = ""
    dynamic var attachment_2_url: String = ""
    dynamic var attachment_3: String = ""
    dynamic var attachment_3_url: String = ""
    dynamic var attachment_4: String = ""
    dynamic var attachment_4_url: String = ""
    dynamic var attachment_5: String = ""
    dynamic var attachment_5_url: String = ""
    
    override static func primaryKey() -> String { return "id" }
    
    convenience init(json: SwiftyJSON.JSON){
        self.init()
        self.id                 = json["id"].intValue
        self.url                = json["url"].stringValue
        self.board_id           = json["board_id"].intValue
        
        self.title              = json["title"].stringValue
        self.subject            = json["subject"].stringValue
        //        self.date = json["date"].
        self.period             = json["period"].stringValue
        self.responsibility     = json["responsibility"].stringValue
        self.place_or_before    = json["place_or_before"].stringValue
        self.after              = json["after"].stringValue
        self.content            = json["content"].stringValue
        self.department         = json["department"].stringValue
        self.grade              = json["grade"].stringValue
        self.note               = json["note"].stringValue
        self.attachment_1       = json["attachment_1"].stringValue
        self.attachment_1_url   = json["attachment_1_url"].stringValue
        self.attachment_2       = json["attachment_2"].stringValue
        self.attachment_2_url   = json["attachment_2_url"].stringValue
        self.attachment_3       = json["attachment_3"].stringValue
        self.attachment_3_url   = json["attachment_3_url"].stringValue
        self.attachment_4       = json["attachment_4"].stringValue
        self.attachment_4_url   = json["attachment_4_url"].stringValue
        self.attachment_5       = json["attachment_5"].stringValue
        self.attachment_5_url   = json["attachment_5_url"].stringValue
    }
}



class IizukaCall: Object {
    private dynamic var id: Int = 0
    private dynamic var url: String = ""
    
    dynamic var title: String = ""
    dynamic var date =  NSDate()
    dynamic var content: String = ""
    dynamic var department: String = ""
    dynamic var grade: String = ""
    dynamic var note: String = ""
    dynamic var finish: String = ""
    
    override static func primaryKey() -> String { return "id" }
    
    convenience init(json: SwiftyJSON.JSON){
        self.init()
        self.id                 = json["id"].intValue
        self.url                = json["url"].stringValue
        
        self.title              = json["title"].stringValue
        //        self.date = json["date"].
        self.content            = json["content"].stringValue
        self.department         = json["department"].stringValue
        self.grade              = json["grade"].stringValue
        self.note               = json["note"].stringValue
    }
}



class IizukaIntensiveLecture: Object {
    private dynamic var id: Int = 0
    private dynamic var url: String = ""
    
    dynamic var title: String = ""
    dynamic var date =  NSDate()
    dynamic var content: String = ""
    dynamic var note: String = ""
    dynamic var attachment_1: String = ""
    dynamic var attachment_1_url: String = ""
    dynamic var attachment_2: String = ""
    dynamic var attachment_2_url: String = ""
    dynamic var attachment_3: String = ""
    dynamic var attachment_3_url: String = ""
    dynamic var attachment_4: String = ""
    dynamic var attachment_4_url: String = ""
    dynamic var attachment_5: String = ""
    dynamic var attachment_5_url: String = ""
    
    override static func primaryKey() -> String { return "id" }
    
    convenience init(json: SwiftyJSON.JSON){
        self.init()
        self.id                 = json["id"].intValue
        self.url                = json["url"].stringValue
        
        self.title              = json["title"].stringValue
        //        self.date = json["date"].
        self.content            = json["content"].stringValue
        self.note               = json["note"].stringValue
        self.attachment_1       = json["attachment_1"].stringValue
        self.attachment_1_url   = json["attachment_1_url"].stringValue
        self.attachment_2       = json["attachment_2"].stringValue
        self.attachment_2_url   = json["attachment_2_url"].stringValue
        self.attachment_3       = json["attachment_3"].stringValue
        self.attachment_3_url   = json["attachment_3_url"].stringValue
        self.attachment_4       = json["attachment_4"].stringValue
        self.attachment_4_url   = json["attachment_4_url"].stringValue
        self.attachment_5       = json["attachment_5"].stringValue
        self.attachment_5_url   = json["attachment_5_url"].stringValue
    }
}


class IizukaStudyingAbroad: Object{
    private dynamic var id: Int = 0
    private dynamic var url: String = ""
    
    dynamic var title: String = ""
    dynamic var date = NSDate()
    dynamic var responsivility: String = ""
    dynamic var content: String = ""
    dynamic var attachment_1: String = ""
    dynamic var attachment_1_url: String = ""
    dynamic var attachment_2: String = ""
    dynamic var attachment_2_url: String = ""
    dynamic var attachment_3: String = ""
    dynamic var attachment_3_url: String = ""
    dynamic var attachment_4: String = ""
    dynamic var attachment_4_url: String = ""
    
    override static func primaryKey() -> String { return "id" }
    
    convenience init(json: SwiftyJSON.JSON){
        self.init()
        self.id                 = json["id"].intValue
        self.url                = json["url"].stringValue
        
        self.title              = json["title"].stringValue
        //        self.date = json["date"].
        self.responsivility     = json["responsibility"].stringValue
        self.content            = json["content"].stringValue
        self.attachment_1       = json["attachment_1"].stringValue
        self.attachment_1_url   = json["attachment_1_url"].stringValue
        self.attachment_2       = json["attachment_2"].stringValue
        self.attachment_2_url   = json["attachment_2_url"].stringValue
        self.attachment_3       = json["attachment_3"].stringValue
        self.attachment_3_url   = json["attachment_3_url"].stringValue
        self.attachment_4       = json["attachment_4"].stringValue
        self.attachment_4_url   = json["attachment_4_url"].stringValue
    }
}



class IizukaScholarship: Object{
    private dynamic var id: Int = 0
    private dynamic var url: String = ""
    
    dynamic var title: String = ""
    dynamic var date = NSDate()
    dynamic var content: String = ""
    dynamic var note: String = ""
    dynamic var attachment_1: String = ""
    dynamic var attachment_1_url: String = ""
    dynamic var attachment_2: String = ""
    dynamic var attachment_2_url: String = ""
    dynamic var attachment_3: String = ""
    dynamic var attachment_3_url: String = ""
    dynamic var finish: String = ""
    
    override static func primaryKey() -> String { return "id" }
    
    convenience init(json: SwiftyJSON.JSON){
        self.init()
        self.id                 = json["id"].intValue
        self.url                = json["url"].stringValue
        
        self.title              = json["title"].stringValue
        //        self.date = json["date"].
        self.content            = json["content"].stringValue
        self.attachment_1       = json["attachment_1"].stringValue
        self.attachment_1_url   = json["attachment_1_url"].stringValue
        self.attachment_2       = json["attachment_2"].stringValue
        self.attachment_2_url   = json["attachment_2_url"].stringValue
        self.attachment_3       = json["attachment_3"].stringValue
        self.attachment_3_url   = json["attachment_3_url"].stringValue
        self.finish             = json["finish"].stringValue
    }
}


class IizukaOther: Object{
    private dynamic var id:Int = 0
    private dynamic var url: String = ""
    
    private dynamic var board_id: Int = 0
    dynamic var title: String = ""
    dynamic var date =  NSDate()
    dynamic var responsibility: String = ""
    dynamic var content: String = ""
    dynamic var note: String = ""
    dynamic var attachment_1: String = ""
    dynamic var attachment_1_url: String = ""
    dynamic var attachment_2: String = ""
    dynamic var attachment_2_url: String = ""
    dynamic var attachment_3: String = ""
    dynamic var attachment_3_url: String = ""
    dynamic var attachment_4: String = ""
    dynamic var attachment_4_url: String = ""
    dynamic var attachment_5: String = ""
    dynamic var attachment_5_url: String = ""
    
    override static func primaryKey() -> String { return "id" }
    
    convenience init(json: SwiftyJSON.JSON){
        self.init()
        self.id                 = json["id"].intValue
        self.url                = json["url"].stringValue
        
        self.board_id           = json["board_id"].intValue
        self.title              = json["title"].stringValue
        //        self.date = json["date"].
        self.responsibility     = json["responsibility"].stringValue
        self.content            = json["content"].stringValue
        self.note               = json["note"].stringValue
        self.attachment_1       = json["attachment_1"].stringValue
        self.attachment_1_url   = json["attachment_1_url"].stringValue
        self.attachment_2       = json["attachment_2"].stringValue
        self.attachment_2_url   = json["attachment_2_url"].stringValue
        self.attachment_3       = json["attachment_3"].stringValue
        self.attachment_3_url   = json["attachment_3_url"].stringValue
        self.attachment_4       = json["attachment_4"].stringValue
        self.attachment_4_url   = json["attachment_4_url"].stringValue
        self.attachment_5       = json["attachment_5"].stringValue
        self.attachment_5_url   = json["attachment_5_url"].stringValue
    }
}


class IizukaHomepage: Object{
    private dynamic var id: Int = 0
    private dynamic var url: String = ""
    
    private dynamic var board_id: Int = 0
    dynamic var date =  NSDate()
    dynamic var place: String = ""
    dynamic var content: String = ""
    dynamic var note: String = ""
    dynamic var inquiry: String = ""
    
    override static func primaryKey() -> String { return  "id" }
    
    convenience init(json: SwiftyJSON.JSON){
        self.init()
        self.id                 = json["id"].intValue
        self.url                = json["url"].stringValue
        
        self.board_id           = json["board_id"].intValue
        //        self.date = json["date"].
        self.place              = json["place"].stringValue
        self.content            = json["content"].stringValue
        self.note               = json["note"].stringValue
        self.inquiry            = json["inquiry"].stringValue
    }
}
