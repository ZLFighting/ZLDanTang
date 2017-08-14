//
//  ZLConst.swift
//  ZLDanTang
//
//  Created by ZL on 2017/8/10.
//  Copyright © 2017年 zhangli. All rights reserved.
//

import UIKit


// 选择环境地址 
// 服务器地址
// 是否使用测试域名
let ZL_IsTestHostUrl = 0

#if !ZL_IsTestHostUrl
let BASE_URL = "http://101.200.196.107:7080" // 正式环境
    
#else
let BASE_URL = "" // 测试地址
    
#endif



//*　-----------------------------------　*//


enum ZLOtherLoginBtnType: Int {
    /// 微博
    case weiboLogin = 100
    /// 微信
    case weChatLogin = 101
    /// QQ
    case QQLogin = 102
}


// 第一次启动
let ZLFirstLaunch = "firstLaunch"
// 是否登录
let isLogin = "isLogin"




//*　----------------尺寸-------------------　*//


// 设置尺寸
// 屏幕的宽
let UI_View_Width = UIScreen.main.bounds.size.width
// 屏幕的高
let UI_View_Height = UIScreen.main.bounds.size.height
    
// iPhone 5
let isIPhone5 = UI_View_Height == 568 ? true : false
// iPhone 6
let isIPhone6 = UI_View_Height == 667 ? true : false
// iPhone 6P
let isIPhone6P = UI_View_Height == 736 ? true : false


// 间距
let kMargin: CGFloat = 10.0

// 我的界面头部图像的高度
let ZLMineHeaderImageHeight: CGFloat = 200



//*　----------------颜色-------------------　*//

// RGBA的颜色设置
func ZLColor(r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
}

// 背景灰色
func ZLGlobalColor() -> UIColor {
    return ZLColor(r: 240, g: 240, b: 240, a: 1)
}

// 红色
func ZLGlobalRedColor() -> UIColor {
    return ZLColor(r: 245, g: 80, b: 83, a: 1.0)
}


