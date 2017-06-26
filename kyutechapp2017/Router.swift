//
//  Router.swift
//  kyutechapp2017
//
//  Created by 山浦功 on 2017/06/09.
//  Copyright © 2017年 塩田宰. All rights reserved.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    case bulletinBoard(genreId: Genre,lastUpdate: Double)
    

    static let prefix = "/api/v3/i"
    static let baseURL = "http://kyutechapp.planningdev.com"
    static let baseURLString = baseURL + prefix
    
    var method: HTTPMethod { switch self { case .bulletinBoard: return .get }}
    
    var path: String { switch self { case .bulletinBoard: return "/bullettinboards.json" }}
    
    // MARK: URLRequestConvertible
    
    func asURLRequest() throws -> URLRequest {
        let url = try Router.baseURLString.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case .bulletinBoard(let genre,let last_update):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: ["genre_id":genre,"update_at":last_update])
        default: break
        }
        return urlRequest
    }
}

