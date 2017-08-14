//
//  ZLBaseViewController.swift
//  ZLDanTang
//
//  Created by ZL on 2017/8/10.
//  Copyright © 2017年 zhangli. All rights reserved.
//  侧滑类基类控制器

import UIKit
import FDFullscreenPopGesture // 侧滑手势
import SVProgressHUD // 提示框

class ZLBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 设置背景色 及 导航标题栏
        view.backgroundColor = ZLGlobalColor()
        navigationController?.fd_prefersNavigationBarHidden = true
        
        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.custom)
        SVProgressHUD.setMinimumDismissTimeInterval(1.0)
        SVProgressHUD.setBackgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.5))
        SVProgressHUD.setForegroundColor(UIColor.white)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
