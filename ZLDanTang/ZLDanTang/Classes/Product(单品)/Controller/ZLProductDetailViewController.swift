//
//  ZLProductDetailViewController.swift
//  ZLDanTang
//
//  Created by ZL on 2017/8/29.
//  Copyright © 2017年 zhangli. All rights reserved.
//
// 单品详情控制器

import UIKit

class ZLProductDetailViewController: ZLBaseViewController, ZLProductDetailToolBarDelegate {
    
    var product: ZLProduct?
    
    var result: ZLSearchResult?
    
    var type = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "GiftShare_icon_18x22_"), style: .plain, target: self, action: #selector(shareItemClick))

        // 设置界面相关
        setupUI()
    }
    
    // MARK: - nav上分享按钮点击
    func shareItemClick() {
        print("点击了分享按钮")
    }
    
    // MARK: - 设置界面相关
    func setupUI() {
        
        // 添加scrollView
        view.addSubview(scrollView)
        
        // 添加底部栏
        view.addSubview(toolBarView)
        
        scrollView.product = product
        
        scrollView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(view)
            make.bottom.equalTo(toolBarView.snp.top)
        }
        
        toolBarView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalTo(view)
            make.height.equalTo(45)
        }
        
        scrollView.contentSize = CGSize(width: UI_View_Width, height: UI_View_Height - 64 - 45 + kMargin + 520)
    }
    
    // MARK: scrollView
    private lazy var scrollView: ZLDetailScrollView = {
        let scrollView = ZLDetailScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        return scrollView
    }()
    
    // MARK: 底部栏
    private lazy var toolBarView: ZLProductDetailToolBar = {
        let toolBarView = Bundle.main.loadNibNamed(String(describing: ZLProductDetailToolBar.self), owner: nil
            , options: nil)?.last as! ZLProductDetailToolBar
        toolBarView.delegate = self
        return toolBarView
    }()
    
    // MARK: 底部栏按钮点击
    func toolBarDidClickedTMALLButton() {
//        let tmAllVC = ZLTMALLViewController()
//        tmAllVC.title = "商品详情"
//        tmAllVC.product = product
//        let nav = ZLNavigationController(rootViewController: tmAllVC)
//        present(nav, animated: true, completion: nil)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ZLProductDetailViewController: UIScrollViewDelegate {
    private func scrollViewDidScroll(scrollView: UIScrollView) {
        var offsetY = scrollView.contentOffset.y
        if offsetY >= 465 {
            offsetY = CGFloat(465)
            scrollView.contentOffset = CGPoint(x: 0, y: offsetY)
        }
    }
}
