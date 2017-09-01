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

        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    func setupUI() {
        
        // 添加顶部滚动视图
        addSubview(topScrollView)
        
        topScrollView.snp.makeConstraints { (make) in
            make.left.equalTo(self)
            make.top.equalTo(self)
            make.size.equalTo(CGSize(width: UI_View_Width, height: 520))
        }
    }
    
    //MARK: - 顶部滚动视图
    private lazy var topScrollView: ZLProductDetailTopView = {
        let topScrollView = ZLProductDetailTopView()
        topScrollView.backgroundColor = UIColor.white
        return topScrollView
    }()

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
