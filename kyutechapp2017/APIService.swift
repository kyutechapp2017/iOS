//
//  APIService.swift
//  kyutechapp2017
//
//  Created by 山浦功 on 2017/06/09.
//  Copyright © 2017年 塩田宰. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIService{
    static func getBoardInfo(genre: Genre, update: Double,  handler: @escaping (JSON)->Void){
        Alamofire.request( Router.bulletinBoard(genreId: genre, lastUpdate: update)  ).responseJSON { (response) in
            
            // error handle
            if let error = response.result.error{
                print(error)
            }
            let json = response.result.value as! JSON
            handler(json)
            
        }
    }
}
