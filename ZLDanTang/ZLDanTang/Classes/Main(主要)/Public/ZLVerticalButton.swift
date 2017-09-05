//
//  ZLVerticalButton.swift
//  ZLDanTang
//
//  Created by ZL on 2017/9/5.
//  Copyright © 2017年 zhangli. All rights reserved.
//
//  自定义按钮:图文居中排列(图片在上文字在右)

import UIKit
import Kingfisher // 缓存图片

// 图文按钮的模型
class BtnModel: NSObject {
    
    var icon_url: String?
    var name: String?
    
    init(dict: [String: AnyObject]) {
        super.init()
        icon_url = dict["icon_url"] as? String
        name = dict["name"] as? String
    }
    
}

class ZLVerticalButton: UIButton {

    var btnModel: BtnModel? {
        didSet {
            let url = btnModel!.icon_url
            imageView?.kf.setImage(with: URL(string: url!)!)
            titleLabel?.text = btnModel!.name
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        titleLabel?.textAlignment = .center
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // 调整图片
        imageView?.x = 10
        imageView?.y = 0
        imageView?.width = self.width - 20
        imageView?.height = imageView!.width
        // 调整文字
        titleLabel?.x = 0
        titleLabel?.y = imageView!.height
        titleLabel?.width = self.width
        titleLabel?.height = self.height - self.titleLabel!.y
    }
    
}
