//
//  ZLProductNetworkTool.swift
//  ZLDanTang
//
//  Created by ZL on 2017/8/29.
//  Copyright © 2017年 zhangli. All rights reserved.
//
// 单品的相关请求接口

import UIKit
import Alamofire // 网络请求
import SVProgressHUD // 提示框
import SwiftyJSON // 解析 JSON 数据

class ZLProductNetworkTool: NSObject {
    
    // 单例
    static let shareNetworkTool = ZLProductNetworkTool()
    
    /// 获取单品数据
    func loadProductData(finished:@escaping (_ products: [ZLProduct]) -> ()) {
        SVProgressHUD.show(withStatus: "正在加载...")
        let url = BASE_URL + "v2/items"
        let params = ["gender": 1,
                      "generation": 1,
                      "limit": 20,
                      "offset": 0]
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
                    if let data = dict["data"].dictionary {
                        if let items = data["items"]?.arrayObject {
                            var products = [ZLProduct]()
                            for item in items {
                                let itemDict = item as! [String : AnyObject]
                                if let itemData = itemDict["data"] {
                                    let product = ZLProduct(dict: itemData as! [String: AnyObject])
                                    products.append(product)
                                }
                            }
                            finished(products)
                        }
                    }
                }
        }
    }
    
    /// 获取单品详情数据
    func loadProductDetailData(id: Int, finished:@escaping (_ productDetail: ZLProductDetail) -> ()) {
        SVProgressHUD.show(withStatus: "正在加载...")
        let url = BASE_URL + "v2/items/\(id)"
        Alamofire // 网络请求
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
                    if let data = dict["data"].dictionaryObject {
                        let productDetail = ZLProductDetail(dict: data as [String : AnyObject])
                        finished(productDetail)
                    }
                }
        }
    }

//    /// 商品详情 评论
//    func loadProductDetailComments(id: Int, finished:@escaping (_ comments: [ZLComment]) -> ()) {
//        SVProgressHUD.show(withStatus: "正在加载...")
//        let url = BASE_URL + "v2/items/\(id)/comments"
//        let params = ["limit": 20,
//                      "offset": 0]
//        Alamofire
//            .request(url, parameters: params)
//            .responseJSON { (response) in
//                guard response.result.isSuccess else {
//                    SVProgressHUD.showError(withStatus: "加载失败...")
//                    return
//                }
//                if let value = response.result.value {
//                    let dict = JSON(value)
//                    let code = dict["code"].intValue
//                    let message = dict["message"].stringValue
//                    guard code == RETURN_OK else {
//                        SVProgressHUD.showInfo(withStatus: message)
//                        return
//                    }
//                    SVProgressHUD.dismiss()
//                    if let data = dict["data"].dictionary {
//                        if let commentsData = data["comments"]?.arrayObject {
//                            var comments = [ZLComment]()
//                            for item in commentsData {
//                                let comment = ZLComment(dict: item as! [String: AnyObject])
//                                comments.append(comment)
//                            }
//                            finished(comments)
//                        }
//                    }
//                }
//        }
//    }

}
