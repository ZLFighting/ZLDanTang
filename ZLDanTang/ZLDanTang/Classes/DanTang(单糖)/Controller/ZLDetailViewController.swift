//
//  ZLDetailViewController.swift
//  ZLDanTang
//
//  Created by ZL on 2017/8/24.
//  Copyright © 2017年 zhangli. All rights reserved.
//
// 单糖商品-详情

import UIKit
import SVProgressHUD // 提示框

class ZLDetailViewController: ZLBaseViewController, UIWebViewDelegate {
    
    var homeItem: ZLHomeItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let webView = UIWebView()
        webView.frame = view.bounds
        // 自动对页面进行缩放以适应屏幕
        webView.scalesPageToFit = true
        webView.dataDetectorTypes = .all
        let url = URL(string: homeItem!.content_url!)
        let request = URLRequest(url: url! as URL)
        webView.loadRequest(request)
        webView.delegate = self
        view.addSubview(webView)
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        SVProgressHUD.setStatus("正在加载...")
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        SVProgressHUD.dismiss()
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
