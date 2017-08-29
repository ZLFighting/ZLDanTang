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

## 随着练习进度增加内容

## 下面是项目的目前初始框架结构

**- Main（主要）**
 - Controller
  - ZLTabBarController.swift 自定义初始化底部子控制器
  - ZLNavigationController.swift nav控制器 NavigationController
  - ZLBaseViewController.swift  基类控制器
  - ZLNewFeatureViewController.swift  新特性(引导页)
 - Tools
  - ZLConst.swift 
**- Login&Register（登录和注册）**
 - Controller
  - ZLLoginViewController.swift 登录控制器
  - ZLLoginViewController.xib
  - ZLRegisterViewController.swift 注册控制器
  - ZLRegisterViewController.xib
 - View
 - Model
**- 首页（单糖）**
 - Controller
  - ZLDanTangViewController.swift 单糖父控制器
  - ZLTopicViewController.swift 单糖子控制器
  - ZLDetailViewController.swift 单糖商品-详情
  - ZLSearchViewController.swift 搜索控制器
 - View
  - ZLHomeCell.swift 首页列表数据Cell
  - ZLHomeCell.xib
  - ZLRefreshControl.swift 刷新控件
  - ZLRefreshView.swift 下拉刷新控件
  - ZLRefreshView.xib 
 - Model
  - ZLHomeItem.swift 首页列表数据Model
  - ZLChannel.swift 首页顶部选择数据Model
  - ZLSearchResult.swift 搜索结果Model
 - Tool
  - ZLDanTangNetworkTool.swift 首页单糖的相关请求接口
**- Product（单品）**
 - Controller
  - ZLProductViewController.swift 单品界面
 - View
  - ZLCollectionViewCell.swift 单品界面的瀑布流cell
  - ZLCollectionViewCell.xib
 - Model
  - ZLProduct.swift 单品的Model
 - Tool
  - ZLProductNetworkTool.swift 单品的相关请求接口
**- Classify（分类）**
 - Controller
  - ZLCategoryViewController.swift 分类界面
 - View
 - Model
**- Me（我）**
 - Controller
  - ZLMeViewController.swift 我的界面
  - ZLMessageViewController.swift  消息控制器
  - ZLSettingViewController.swift  设置控制器
 - View
  - ZLMineHeaderView.swift 我的界面下 头部视图
  - ZLMeFooterView.swift 我的界面下 底部视图
  - ZLMeChoiceView.swift 我的界面下 分区头喜欢视图(两个按钮分段控件)
  - ZLSettingCell.swift 设置cell
  - ZLSettingCell.xib  
 - Model
  - ZLSettingModel.swift 设置模型

 




