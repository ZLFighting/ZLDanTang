//
//  ZLSettingModel.swift
//  ZLDanTang
//
//  Created by ZL on 2017/8/17.
//  Copyright © 2017年 zhangli. All rights reserved.
//  设置Model

import UIKit

class ZLSettingModel: NSObject {
    
    var iconImage: String?
    var leftTitle: String?
    var rightTitle: String?
    var isHiddenSwitch: Bool?
    var isHiddenRightTip: Bool?
    
    init(dict: [String: AnyObject]) {
        super.init()
        
        iconImage = dict["iconImage"] as? String
        leftTitle = dict["leftTitle"] as? String
        rightTitle = dict["rightTitle"] as? String
        isHiddenSwitch = dict["isHiddenSwitch"] as? Bool
        isHiddenRightTip = dict["isHiddenRightTip"] as? Bool
    }

}
