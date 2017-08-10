//
//  ZLTabBarController.swift
//  ZLDanTang
//
//  Created by ZL on 2017/8/10.
//  Copyright © 2017年 zhangli. All rights reserved.
//  自定义初始化底部子控制器

import UIKit

class ZLTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabBar = UITabBar.appearance()
        tabBar.tintColor = ZLColor(r: 245, g: 90, b: 93, a: 1/0)
        addChildViewControllers()
    }
    
    /**
     * 添加子控制器
     */
    private func addChildViewControllers() {
        addChildViewController(childController: ZLDanTangViewController(), title: "单糖", imageName: "TabBar_home_23x23_")
        addChildViewController(childController: ZLProductViewController(), title: "单品", imageName: "TabBar_gift_23x23_")
        addChildViewController(childController: ZLCategoryViewController(), title: "分类", imageName: "TabBar_category_23x23_")
        addChildViewController(childController: ZLMeViewController(), title: "我的", imageName: "TabBar_me_boy_23x23_")
    }
    
    /**
     * 初始化子控制器
     
     - parameter childControllerName: 需要初始化的控制器
     - parameter title:               标题
     - parameter imageName:           图片名称
     */
    private func addChildViewController(childController: UIViewController, title: String, imageName: String) {
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: imageName + "selected")
        childController.title = title
        
        let navC = ZLNavigationController(rootViewController: childController)
        addChildViewController(navC)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
