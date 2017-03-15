//
//  UserTimetableRealm.swift
//  kyutechapp2017
//
//  Created by 塩田宰 on 2017/03/13.
//  Copyright © 2017年 塩田宰. All rights reserved.
//

import UIKit
import RealmSwift

class TimetableRealm: NSObject {

    let realm = try! Realm()
    var userTimetable = UserTimetable()
    
    func getUserTimetableObjects() -> Results<UserTimetable> {
        return realm.objects(UserTimetable.self)
    }
    
    func addUserTimetableInfo(cellTag: Int, classname: String, classroom: String) {
        userTimetable.cellTag = cellTag
        userTimetable.classname = classname
        userTimetable.classroom = classroom
        try! realm.write {
            realm.add(userTimetable)
        }
    }
    
    func removeUserTimetableInfo(cellTag: Int) {
        userTimetable = realm.objects(UserTimetable.self).filter("cellTag == %@", cellTag)
        _ = try? realm.write {
            realm.delete(userTimetable)
        }
    }
    
}
