//
//  ZLDanTangNetworkTool.swift
//  ZLDanTang
//
//  Created by ZL on 2017/8/22.
//  Copyright © 2017年 zhangli. All rights reserved.
//  首页的网络请求工具

import UIKit
import Alamofire // 网络请求
import SVProgressHUD // 提示框
import SwiftyJSON // 解析 JSON 数据

class ZLDanTangNetworkTool: NSObject {
    // 单例
    static let shareNetworkTool = ZLDanTangNetworkTool()
    
    /// 获取首页数据
    func loadHomeInfo(id: Int, finished:@escaping (_ homeItems: [ZLHomeItem]) -> ()) {
//        let url = BASE_URL + "v1/channels/\(id)/items?gender=1&generation=1&limit=20&offset=0"
        let url = BASE_URL + "v1/channels/\(id)/items"
        let params = ["gender": 1,
                      "generation": 1,
                      "limit": 20,
                      "offset": 0]
        Alamofire // 网络请求
            .request(url, parameters: params)
            .responseJSON { (response) in
                guard response.result.isSuccess else {
                    SVProgressHUD.showError(withStatus: "加载失败...")
                    return
                }
                if let value = response.result.value {
                    let dict = JSON(value)
                    let code = dict["code"].intValue
                    let message = dict["message"].stringValue
                    guard code == RETURN_OK else {
                        SVProgressHUD.showInfo(withStatus: message)
                        return
                    }
                    let data = dict["data"].dictionary
                    //  字典转成模型
                    if let items = data!["items"]?.arrayObject {
                        var homeItems = [ZLHomeItem]()
                        for item in items {
                            let homeItem = ZLHomeItem(dict: item as! [String: AnyObject])
                            homeItems.append(homeItem)
                        }
                        finished(homeItems)
                    }
                }
        }
    }
    
    /// 获取首页顶部选择数据
    func loadHomeTopData(finished:@escaping (_ ZL_channels: [ZLChannel]) -> ()) {
        
        let url = BASE_URL + "v2/channels/preset"
        let params = ["gender": 1,
                      "generation": 1]
        Alamofire 
            .request(url, parameters: params)
            .responseJSON { (response) in
                guard response.result.isSuccess else {
                    SVProgressHUD.showError(withStatus: "加载失败...")
                    return
                }
                if let value = response.result.value {
                    let dict = JSON(value)
                    let code = dict["code"].intValue
                    let message = dict["message"].stringValue
                    guard code == RETURN_OK else {
                        SVProgressHUD.showInfo(withStatus: message)
                        return
                    }
                    SVProgressHUD.dismiss()
                    let data = dict["data"].dictionary
                    if let channels = data!["channels"]?.arrayObject {
                        var ZL_channels = [ZLChannel]()
                        for channel in channels {
                            let ZL_channel = ZLChannel(dict: channel as! [String: AnyObject])
                            ZL_channels.append(ZL_channel)
                        }
                        finished(ZL_channels)
                    }
                }
        }
    }
    
    /// 搜索界面数据
    func loadHotWords(finished:@escaping (_ words: [String]) -> ()) {
        SVProgressHUD.show(withStatus: "正在加载...")
        let url = BASE_URL + "v1/search/hot_words"
        Alamofire
            .request(url)
            .responseJSON { (response) in
                guard response.result.isSuccess else {
                    SVProgressHUD.showError(withStatus: "加载失败...")
                    return
                }
                if let value = response.result.value {
                    let dict = JSON(value)
                    let code = dict["code"].intValue
                    let message = dict["message"].stringValue
                    guard code == RETURN_OK else {
                        SVProgressHUD.showInfo(withStatus: message)
                        return
                    }
                    SVProgressHUD.dismiss()
                    if let data = dict["data"].dictionary {
                        if let hot_words = data["hot_words"]?.arrayObject {
                            finished(hot_words as! [String])
                        }
                    }
                }
        }
    }
    
    /// 根据搜索条件进行搜索
    func loadSearchResult(keyword: String, sort: String, finished:@escaping (_ results: [ZLSearchResult]) -> ()) {
        SVProgressHUD.show(withStatus: "正在加载...")
        let url = "http://api.dantangapp.com/v1/search/item"
        
        let params = ["keyword": keyword,
                      "limit": 20,
                      "offset": 0,
                      "sort": sort] as [String : Any]
        Alamofire
            .request(url, parameters: params)
            .responseJSON { (response) in
                guard response.result.isSuccess else {
                    SVProgressHUD.showError(withStatus: "加载失败...")
                    return
                }
                if let value = response.result.value {
                    let dict = JSON(value)
                    let code = dict["code"].intValue
                    let message = dict["message"].stringValue
                    guard code == RETURN_OK else {
                        SVProgressHUD.showInfo(withStatus: message)
                        return
                    }
                    SVProgressHUD.dismiss()
                    let data = dict["data"].dictionary
                    if let items = data!["items"]?.arrayObject {
                        var results = [ZLSearchResult]()
                        for item in items {
                            let result = ZLSearchResult(dict: item as! [String: AnyObject])
                            results.append(result)
                        }
                        finished(results)
                    }
                }
        }
    }
    
}

