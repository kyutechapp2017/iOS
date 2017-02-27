//
//  Config.swift
//  kyutechapp2017
//
//  Created by 塩田宰 on 2017/02/26.
//  Copyright © 2017年 塩田宰. All rights reserved.
//

// swiftlint:disable type_name
import UIKit

struct Config {
    static let host         = Config.plist(property: "host")
    static let version      = Config.plist(property: "version")
    static let mode         = Config.plist(property: "api")
    static let bundleID     = Bundle.main.bundleIdentifier ?? Config.host
    #if DEMOMONA
    static let plistPath = "DemoApi"
    #elseif DEVMONA
    static  let plistPath = "DevApi"
    #else
    static let plistPath = "Api"
    #endif
    
    static func plist(property: String) -> String {
        let pat = Config.plistPath
        guard let path = Bundle.main.path(forResource: pat, ofType: "plist") else { return "" }
        var dict = NSDictionary(contentsOfFile: path) as? [String: Any]
        if let string = dict?.removeValue(forKey: property) as? String {
            return string
        }
        return ""
    }
}
