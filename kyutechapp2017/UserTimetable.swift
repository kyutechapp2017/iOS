//
//  UserTimetable.swift
//  kyutechapp2017
//
//  Created by 塩田宰 on 2017/03/08.
//  Copyright © 2017年 塩田宰. All rights reserved.
//

import Foundation
import RealmSwift

class UserTimetable: Object {
    
    dynamic var cellTag: Int = 0
    dynamic var term: Int = 0
    dynamic var classname: String = ""
    dynamic var classroom: String = ""

}
