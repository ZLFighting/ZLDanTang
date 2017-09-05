//
//  ZLShareButtonView.swift
//  ZLDanTang
//
//  Created by ZL on 2017/9/5.
//  Copyright © 2017年 zhangli. All rights reserved.
//
//  商品分享底部弹框视图-内部按钮

import UIKit

class ZLShareButtonView: UIView {
    
    // 图片数组
    let images = ["Share_WeChatTimelineIcon_70x70_", "Share_WeChatSessionIcon_70x70_", "Share_WeiboIcon_70x70_", "Share_QzoneIcon_70x70_", "Share_QQIcon_70x70_", "Share_CopyLinkIcon_70x70_"]
    // 标题数组
    let titles = ["微信朋友圈", "微信好友", "微博", "QQ 空间", "QQ 好友", "复制链接"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    // MARK:- 设置UI相关
    private func setupUI() {
        
        let maxCols = 3
        
        let buttonW: CGFloat = 70
        let buttonH: CGFloat = buttonW + 30
        let buttonStartX: CGFloat = 20
        let xMargin: CGFloat = (UI_View_Width - 20 - 2 * buttonStartX - CGFloat(maxCols) * buttonW) / CGFloat(maxCols - 1)
        
        // 创建按钮
        for index in 0..<images.count {
            let button = ZLVerticalButton()
            button.tag = index
            button.setImage(UIImage(named: images[index]), for: .normal)
            button.setTitle(titles[index], for: .normal)
            button.setTitleColor(UIColor.black, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            button.width = buttonW
            button.height = buttonH
            button.addTarget(self, action: #selector(shareButtonClick), for: .touchUpInside)
            
            // 计算 X、Y
            let row = Int(index / maxCols)
            let col = index % maxCols
            let buttonX: CGFloat = CGFloat(col) * (xMargin + buttonW) + buttonStartX
            let buttonMaxY: CGFloat = CGFloat(row) * buttonH
            let buttonY = buttonMaxY
            button.frame = CGRect(x: buttonX, y: buttonY, width: buttonW, height: buttonH)
            addSubview(button)
        }
    }
    
    func shareButtonClick(button: UIButton) {
        if let shareButtonType = ZLShareButtonType(rawValue: button.tag) {
            switch shareButtonType {
            case .WeChatTimeline:
                print("点击了WeChatTimeline分享 = \(button.tag)")

                break
            case .WeChatSession:
                print("点击了WeChatSession分享 = \(button.tag)")

                break
            case .Weibo:
                print("点击了Weibo分享 = \(button.tag)")
                
                break
            case .QZone:
                print("点击了QZone分享 = \(button.tag)")

                break
            case .QQFriends:
                print("点击了QQFriends分享 = \(button.tag)")

                break
            case .CopyLink:
                print("点击了CopyLink分享 = \(button.tag)")

                break
            }
        }
        print(button.titleLabel!.text!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

