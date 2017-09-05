//
//  ZLProductDetailToolBar.swift
//  ZLDanTang
//
//  Created by ZL on 2017/8/30.
//  Copyright © 2017年 zhangli. All rights reserved.
//
// 单品详情的底部栏View(去天猫购买及喜欢)

import UIKit

protocol ZLProductDetailToolBarDelegate: NSObjectProtocol {
    func toolBarDidClickedTMALLButton() // 去天猫购买 
}

class ZLProductDetailToolBar: UIView {
    
    weak var delegate: ZLProductDetailToolBarDelegate?
    
    @IBOutlet weak var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        likeButton.layer.borderColor = ZLGlobalRedColor().cgColor
        likeButton.layer.borderWidth = klineWidth
        likeButton.setImage(UIImage(named: "content-details_like_16x16_"), for: .normal)
        likeButton.setImage(UIImage(named: "content-details_like_selected_16x16_"), for: .selected)
    }
    
    @IBAction func likeButtonClick(sender: UIButton) { // 喜欢按钮
        // 判断是否登录
        if UserDefaults.standard.bool(forKey: isLogin) {
            sender.isSelected = !sender.isSelected
        } else {
            let loginVC = ZLLoginViewController()
            loginVC.title = "登录"
            let nav = ZLNavigationController(rootViewController: loginVC)
            UIApplication.shared.keyWindow?.rootViewController?.present(nav, animated: true, completion: nil)
        }
    }
    
    @IBAction func goTMALLButtonClick() {
        delegate?.toolBarDidClickedTMALLButton()
    }
}

