//
//  ZLChannel.swift
//  ZLDanTang
//
//  Created by ZL on 2017/8/22.
//  Copyright © 2017年 zhangli. All rights reserved.
//  首页顶部选择数据Model

import UIKit

class ZLChannel: NSObject {
    
    var editable: Bool?
    var id: Int?
    var name: String?
    
    init(dict: [String: AnyObject]) {
        id = dict["id"] as? Int
        name = dict["name"] as? String
        editable = dict["editable"] as? Bool
    }
}
