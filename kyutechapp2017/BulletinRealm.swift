//
//  BulletinRealm.swift
//  kyutechapp2017
//
//  Created by 山浦功 on 2017/04/17.
//  Copyright © 2017年 塩田宰. All rights reserved.
//

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
}



class IizukaScholarship: Object{
    private dynamic var id: Int = 0
    private dynamic var url: String = ""
    
    dynamic var title: String = ""
    dynamic var date = NSDate()
    dynamic var content: String = ""
    dynamic var note: String = ""
    dynamic var attachment_1: String = ""
    dynamic var attachmen__1_url: String = ""
    dynamic var attachment_2: String = ""
    dynamic var attachment_2_url: String = ""
    dynamic var attachment_3: String = ""
    dynamic var attachment_3_url: String = ""
    dynamic var finish: String = ""
    
    override static func primaryKey() -> String { return "id" }
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
}


class IizukaHomepage: Object{
    private dynamic var id: Int = 0
    private dynamic var url: String = ""
    
    private dynamic var board_id: Int = 0
    dynamic var date =  Date()
    dynamic var place: String = ""
    dynamic var content: String = ""
    dynamic var note: String = ""
    dynamic var inquiry: String = ""
    
    override static func primaryKey() -> String { return  "id" }
}
