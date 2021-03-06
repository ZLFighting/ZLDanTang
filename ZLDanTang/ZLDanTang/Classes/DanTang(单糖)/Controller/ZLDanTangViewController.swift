//
//  ZLDanTangViewController.swift
//  ZLDanTang
//
//  Created by ZL on 2017/8/10.
//  Copyright © 2017年 zhangli. All rights reserved.
//  单糖父控制器

import UIKit

// 顶部标题的y
let kTitlesViewY: CGFloat = 64
// 顶部标题的高度
let kTitlesViewH: CGFloat = 35

class ZLDanTangViewController: ZLBaseViewController, UIScrollViewDelegate {
    
    var channels = [ZLChannel]()

    // 标签
    weak var titlesView = UIView()
    // 底部红色指示器
    weak var indicatorView = UIView()
    
    weak var contentView = UIScrollView()
    // 当前选中的按钮
    weak var selectedButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        //  设置导航栏
        setupNav()
        
        weak var weakSelf = self
        // 获取首页顶部选择数据
        ZLDanTangNetworkTool.shareNetworkTool.loadHomeTopData { (ZL_channels) in
            for channel in ZL_channels {
                let vc = ZLTopicViewController()
                vc.title = channel.name!
                vc.type = channel.id!
                weakSelf!.addChildViewController(vc)
            }
            // 设置顶部标签栏
            weakSelf!.setupTitlesView()
            // 底部的scrollview
            weakSelf!.setupContentView()
        }
    }
    
    // MARK: - 设置导航栏
    func setupNav() {
        view.backgroundColor = UIColor.white
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Feed_SearchBtn_18x18_"), style: .plain, target: self, action: #selector(searchRightClick))
    }
    
    func searchRightClick() {
        print("点击了搜索")
        let searchBarVC = ZLSearchViewController()
        navigationController?.pushViewController(searchBarVC, animated: true)
    }
    
    // MARK: - 初始化子控制器
    func setupChildViewControllers() {
        for channel in channels {
            let vc = ZLTopicViewController()
            vc.title = channel.name
            addChildViewController(vc)
        }
    }
    
    // MARK: - 顶部标签栏
    func setupTitlesView() {
        // 顶部背景
        let bgView = UIView()
        bgView.frame = CGRect(x: 0, y: kTitlesViewY, width: UI_View_Width, height: kTitlesViewH)
        view.addSubview(bgView)
        // 标签
        let titlesView = UIView()
        titlesView.backgroundColor = ZLGlobalColor()
        titlesView.frame = CGRect(x: 0, y: 0, width: UI_View_Width - kTitlesViewH, height: kTitlesViewH)
        bgView.addSubview(titlesView)
        self.titlesView = titlesView
        // 底部红色指示器
        let indicatorView = UIView()
        indicatorView.backgroundColor = ZLGlobalRedColor()
        indicatorView.height = kIndicatorViewH
        indicatorView.y = kTitlesViewH - kIndicatorViewH
        indicatorView.tag = -1
        self.indicatorView = indicatorView
        
        // 选择按钮
        let arrowButton = UIButton()
        arrowButton.frame = CGRect(x: UI_View_Width - kTitlesViewH, y: 0, width: kTitlesViewH, height: kTitlesViewH)
        arrowButton.setImage(UIImage(named: "arrow_index_down_8x4_"), for: .normal)
        arrowButton.addTarget(self, action: #selector(arrowButtonClick), for: .touchUpInside)
        arrowButton.backgroundColor = ZLGlobalColor()
        bgView.addSubview(arrowButton)
        
        // 内部子标签
        let count = childViewControllers.count
        let width = titlesView.width / CGFloat(count)
        let height = titlesView.height
        
        for index in 0..<count {
            let button = UIButton()
            button.height = height
            button.width = width
            button.x = CGFloat(index) * width
            button.tag = index
            let vc = childViewControllers[index]
            button.titleLabel!.font = UIFont.systemFont(ofSize: 14)
            button.setTitle(vc.title!, for: .normal)
            button.setTitleColor(UIColor.gray, for: .normal)
            button.setTitleColor(ZLGlobalRedColor(), for: .disabled)
            button.addTarget(self, action: #selector(titlesClick), for: .touchUpInside)
            titlesView.addSubview(button)
            // 默认点击了第一个按钮
            if index == 0 {
                button.isEnabled = false
                selectedButton = button
                // 让按钮内部的Label根据文字来计算内容
                button.titleLabel?.sizeToFit()
                indicatorView.width = button.titleLabel!.width
                indicatorView.centerX = button.centerX
            }
        }
        // 底部红色指示器
        titlesView.addSubview(indicatorView)
    }

    /// 箭头按钮点击
    func arrowButtonClick(button: UIButton) {
        UIView.animate(withDuration: kAnimationDuration) {
            button.imageView?.transform = button.imageView!.transform.rotated(by: CGFloat(Double.pi))
        }
    }
    
    /// 标签上的按钮点击
    func titlesClick(button: UIButton) {
        
        // 修改按钮状态
        selectedButton!.isEnabled = true
        button.isEnabled = false
        selectedButton = button
                
        // 让标签执行动画
        UIView.animate(withDuration: kAnimationDuration) {
            self.indicatorView!.width = self.selectedButton!.titleLabel!.width
            self.indicatorView!.centerX = self.selectedButton!.centerX
        }
        // 滚动,切换子控制器
        var offset = contentView!.contentOffset
        offset.x = CGFloat(button.tag) * contentView!.width
        contentView!.setContentOffset(offset, animated: true)
    }

    // MARK: - 底部的scrollview
    func setupContentView() {
        // 不要自动调整inset
        automaticallyAdjustsScrollViewInsets = false
        
        let contentView = UIScrollView()
        contentView.frame = view.bounds
        contentView.delegate = self
        contentView.contentSize = CGSize(width: contentView.width * CGFloat(childViewControllers.count), height: 0)
        contentView.isPagingEnabled = true
        view.insertSubview(contentView, at: 0)
        self.contentView = contentView
        // 添加第一个控制器的view
        scrollViewDidEndScrollingAnimation(contentView)
    }

    // MARK: - UIScrollViewDelegate
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        // 添加子控制器的 view
        // 当前索引
        let index = Int(scrollView.contentOffset.x / scrollView.width)
        // 取出子控制器
        let vc = childViewControllers[index]
        vc.view.x = scrollView.contentOffset.x
        vc.view.y = 0 // 设置控制器的y值为0(默认为20)
        // 设置控制器的view的height值为整个屏幕的高度（默认是比屏幕少电池条20）
        vc.view.height = scrollView.height
        scrollView.addSubview(vc.view)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollViewDidEndScrollingAnimation(scrollView)
        // 当前索引
        let index = Int(scrollView.contentOffset.x / scrollView.width)
        // 点击 Button
        let button = titlesView!.subviews[index] as! UIButton
        titlesClick(button: button)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
