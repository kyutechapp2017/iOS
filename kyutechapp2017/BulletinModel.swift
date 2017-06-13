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
    var call = [Call]()
    var intensiveLecture = [IntensiveLecture]()
    var studyAbroad = [StudyAbroad]()
    var scholarship = [Scholarship]()
    var homepage = [Homepage]()
    
    
    func getNotice(genre: Genre, update: Double){
        APIService.getBoardInfo(genre: genre, update: update, handler: { (json) in
            let array = json.arrayValue
            
            switch genre{
            case .all: break
            case .notice: BulletinModel.sharedInstance.notices =  array.map{ Notice(json: $0) }
            case .lecture: BulletinModel.sharedInstance.lectures =  array.map{ Lecture(json: $0) }
            case .call: BulletinModel.sharedInstance.call = array.map{ Call(json: $0)}
            case .intensiveLecture: BulletinModel.sharedInstance.intensiveLecture = array.map{ IntensiveLecture(json: $0)}
            case .studyAbroad: BulletinModel.sharedInstance.studyAbroad = array.map{ StudyAbroad(json: $0)}
            case .scholarship: BulletinModel.sharedInstance.scholarship = array.map{ Scholarship(json: $0)}
            case .homepage: BulletinModel.sharedInstance.homepage = array.map{ Homepage(json: $0)}
            }

            
        })
        
    }
    
}

enum Genre: Int {
    case all, notice, lecture, call, intensiveLecture, studyAbroad, scholarship, homepage
}






//
//func getData(){
////    Alamofire.request("http://kyutechapp.planningdev.com/api/v3/i/bullettinboards.json", Parameters: ["guard_id": "0"]).responseJSON {
////        response in
////        let json = JSON(response.result.value)
////        json["info"].forEach{(_, data) in
////            let type = data["type"].string!
////            print(type)
////        }
////    }
////    Alamofire.request("http://kyutechapp.planningdev.com/api/v3/i/bullettinboards.json", method: .get, parameters: ["guard_id": "0"], encoding: JSONEncoding, headers: .get).responseJSON{
////        response in
////        let json = JSON(response.resuls)
////    }
//}
//
//func getttt(){
//    Alamofire.request("http://kyutechapp.planningdev.com/api/v3/i/bullettinboards.json").responseJSON{
//        response in
//        print(response.request)
//        print(response.response)
//        print(response.data)
//        print(response.result)
//        
//        if let json = response.result.value{
//            print("JSON: \(json)")
//        }
//        
//    }
//}
//
//
//class IizukaNoticeModel: NSObject {
//    class var sharedInstanse: IizukaNoticeModel{
//        struct Singleton {
//            static var instance = IizukaNoticeModel()
//        }
//        return Singleton.instance
//    }
//    
//    dynamic var bulletin: [IizukaNotice] = []
//    
//    private override init() {
//        super.init()
//    }
//    
//    func getList(){
//        
//    }
//}
//
//class IizukaCallModel: NSObject{
//    class var sharedInstance: IizukaCallModel{
//        struct Singleton{
//            static var instance = IizukaCallModel()
//        }
//        return Singleton.instance
//    }
//    dynamic var IizukaCall: [IizukaCallModel] = []
//    
//    private override init() {
//        super.init()
//    }
//}
