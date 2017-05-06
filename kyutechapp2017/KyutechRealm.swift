//
//  KyutechRealm.swift
//  kyutechapp2017
//
//  Created by 塩田宰 on 2017/04/21.
//  Copyright © 2017年 塩田宰. All rights reserved.
//

import UIKit
import RealmSwift

class KyutechRealm: NSObject {
    
    let realm = try! Realm()
    
    func getUserTimetableObjects() -> Results<UserTimetable> {
        return realm.objects(UserTimetable.self)
    }
    
    func addUserTimetableInfo(cellTag: Int, term: Int, classname: String, classroom: String) {
        let userTimetable = UserTimetable()
        userTimetable.cellTag = cellTag
        userTimetable.term = term
        userTimetable.classname = classname
        userTimetable.classroom = classroom
        try! realm.write {
            realm.add(userTimetable)
        }
    }
    
    func removeUserTimetableInfo(cellTag: Int) {
        let classData = realm.objects(UserTimetable.self).filter("cellTag == %@", cellTag)
        //        _ = try? realm.write {
        //            realm.delete(classData)
        //        }
        try! realm.write {
            realm.delete(classData)
        }
    }

}
