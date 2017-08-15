# ZLDanTang
练习 Swift -单糖项目

仅仅为个人练习Swift3.0使用!!! 

## 项目环境

项目使用 cocoapods 来管理第三方库, 需要安装 cocoapods，安装方式教程:[CocoaPods-1.2.0安装及使用](http://www.jianshu.com/p/e76ce44f97cb)。

- Xcode 8.3.3
- Swift 3.0
- iOS 8.0


## 使用到的第三方库：

1. Alamofire (4.3.0)  - 网络请求
2. FDFullscreenPopGesture (1.1) - 侧滑手势
3. Kingfisher (3.3.4) - 缓存图片
4. SVProgressHUD (2.1.2) - 提示框
5. SnapKit (3.1.2)  - 设置约束
6. SwiftyJSON (3.1.4)  - 解析 JSON 数据


由于刚接触 Swift，项目采用传统的 MVC 设计模式。


## 下面是项目的初始框架结构

- Main（主要）
 - Controller
  - ZLTabBarController.swift 自定义初始化底部子控制器
  - ZLNavigationController.swift nav控制器 NavigationController
  - ZLBaseViewController.swift  基类控制器
  - ZLNewFeatureViewController.swift  新特性(引导页)
 - Tools
  - ZLConst.swift 
- Login&Register（登录和注册）
 - Controller
  - ZLLoginViewController.swift 登录控制器
  - ZLLoginViewController.xib
  - ZLRegisterViewController.swift 注册控制器
  - ZLRegisterViewController.xib
 - View
 - Model
- 首页（单糖）
 - Controller
  - ZLDanTangViewController.swift 单糖界面
 - View
 - Model
- Product（单品）
 - Controller
  - ZLProductViewController.swift 单品界面
 - View
 - Model
- Classify（分类）
 - Controller
  - ZLCategoryViewController.swift 分类界面
 - View
 - Model
- Me（我）
 - Controller
  - ZLMeViewController.swift 我的界面
 - View
  - ZLMineHeaderView.swift 我的界面下 头部视图
  - ZLMeFooterView.swift 我的界面下 底部视图
 - Model

随着练习进度增加内容 




