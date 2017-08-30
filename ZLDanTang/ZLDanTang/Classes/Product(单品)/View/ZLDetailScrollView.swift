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

        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
