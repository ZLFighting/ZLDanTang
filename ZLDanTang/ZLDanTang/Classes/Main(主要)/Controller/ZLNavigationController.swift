//
//  ZLNavigationController.swift
//  ZLDanTang
//
//  Created by ZL on 2017/8/10.
//  Copyright © 2017年 zhangli. All rights reserved.
//  nav控制器 NavigationController

import UIKit
import SVProgressHUD // 提示框

class ZLNavigationController: UINavigationController {
    
    internal override class func initialize() {
        super.initialize()
        
        // 设置整个项目所有nav的item的主题样式
        // 设置导航栏标题
        let navBar = UINavigationBar.appearance()
        navBar.barTintColor = ZLGlobalRedColor()
        navBar.tintColor = UIColor.white
        navBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: UIFont.systemFont(ofSize: 20)]
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        // 设置整个项目所有nav的item的主题样式
//        // 设置导航栏标题
//        let navBar = UINavigationBar.appearance()
//        navBar.barTintColor = ZLGlobalRedColor()
//        navBar.tintColor = UIColor.white
//        navBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: UIFont.systemFont(ofSize: 20)]
    }
    
    /**
     * 统一所有控制器导航栏左上角的返回按钮
     * 重写这个方法目的：能够拦截所有push进来的控制器，它的导航栏左上角的内容都一样
     * 能拦截所有的push操作
     - parameter viewController: 需要压栈的控制器 即将push进来的控制器
     - parameter animated:       是否动画
     */
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        // 这时push进来的控制器viewController，不是第一个子控制器（不是根控制器）
        if viewControllers.count > 0 {
            
            /* push 后隐藏tabbar 自动显示和隐藏tabbar */
            viewController.hidesBottomBarWhenPushed = true
            
            /* 设置导航栏上面的内容 */
            // 设置左边返回按钮
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "checkUserType_backward_9x15_"), style: .plain, target: self, action: #selector(navigationBackClick))
        }
        super.pushViewController(viewController, animated: true)
    }
    
    // 返回按钮
    func navigationBackClick() {
        if SVProgressHUD.isVisible() {
            SVProgressHUD.dismiss()
        }
        if UIApplication.shared.isNetworkActivityIndicatorVisible {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
        // 因为self本来就是一个导航控制器，则不用super
        // 回退到上个push过来的控制器
        popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
