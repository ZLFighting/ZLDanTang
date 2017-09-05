//
//  ZLTMALLViewController.swift
//  ZLDanTang
//
//  Created by ZL on 2017/9/5.
//  Copyright © 2017年 zhangli. All rights reserved.
//
//  去天猫购买

import UIKit

class ZLTMALLViewController: ZLBaseViewController {

    @IBOutlet weak var webView: UIWebView!
    
    var product: ZLProduct?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
        
        // 自动对页面进行缩放以适应屏幕
        webView.scalesPageToFit = true
        webView.dataDetectorTypes = .all
        let url = URL(string: product!.purchase_url!)
        let request = URLRequest(url: url!)
        webView.loadRequest(request)
    }
    
    private func setupNav() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "checkUserType_backward_9x15_"), style: .plain, target: self, action: #selector(navigationBackClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "GiftShare_icon_18x22_"), style: .plain, target: self, action: #selector(shareBBItemClick))
    }
    
    func shareBBItemClick() { // 分享
        print("点击分享")
        ZLShareActionSheet.show()
    }
    
    func navigationBackClick() {
        dismiss(animated: true, completion: nil)
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
