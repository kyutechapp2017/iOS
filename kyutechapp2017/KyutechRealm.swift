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
    
    // Timetable
    func getUserTimetableObjects(term: Int) -> Results<UserTimetable> {
        return realm.objects(UserTimetable.self).filter("term == %@", term)
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
    
    func removeUserTimetableInfo(cellTag: Int, term: Int) {
        let classData = realm.objects(UserTimetable.self).filter("cellTag == %@ && term == %@", cellTag, term)
        try! realm.write {
            realm.delete(classData)
        }
    }
    
    // UserSetting
    func addUserSettingTermInfo(term: Int) {
        let userSetting = UserSetting()
        userSetting.term = term
        try! realm.write {
            
        }
    }

}
