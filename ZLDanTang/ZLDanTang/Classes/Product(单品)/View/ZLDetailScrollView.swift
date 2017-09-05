//
//  ZLDetailScrollView.swift
//  ZLDanTang
//
//  Created by ZL on 2017/8/30.
//  Copyright © 2017年 zhangli. All rights reserved.
//
// 单品详情的scrollView

import UIKit

class ZLDetailScrollView: UIScrollView {

    var product: ZLProduct? {
        didSet {
            topScrollView.product = product
            bottomScrollView.product = product
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    func setupUI() {
        
        // 添加顶部滚动视图
        addSubview(topScrollView)
        
        // 添加底部滚动视图
        addSubview(bottomScrollView)
        
        topScrollView.snp.makeConstraints { (make) in
            make.left.equalTo(self)
            make.top.equalTo(self)
            make.size.equalTo(CGSize(width: UI_View_Width, height: 520))
        }
        
        bottomScrollView.snp.makeConstraints { (make) in
            make.left.equalTo(self)
            make.top.equalTo(topScrollView.snp.bottom).offset(kMargin)
            make.size.equalTo(CGSize(width: UI_View_Width, height: UI_View_Height - 64 - 45))
        }
    }
    
    //MARK: - 顶部滚动视图
    private lazy var topScrollView: ZLProductDetailTopView = {
        let topScrollView = ZLProductDetailTopView()
        topScrollView.backgroundColor = UIColor.white
        return topScrollView
    }()
    
    //MARK: - 底部滚动视图
    private lazy var bottomScrollView: ZLProductDetailBottomView = {
        let bottomScrollView = ZLProductDetailBottomView()
        bottomScrollView.backgroundColor = UIColor.white
        return bottomScrollView
    }()

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
