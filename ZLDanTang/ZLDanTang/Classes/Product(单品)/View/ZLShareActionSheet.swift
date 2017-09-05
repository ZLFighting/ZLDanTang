//
//  ZLShareActionSheet.swift
//  ZLDanTang
//
//  Created by ZL on 2017/9/5.
//  Copyright © 2017年 zhangli. All rights reserved.
//
//  商品分享底部弹框视图

import UIKit
import SnapKit // 设置约束

// 分享按钮背景高度
let shareTopViewH: CGFloat = 230

class ZLShareActionSheet: UIView {
    
    class func show() {
        let actionSheet = ZLShareActionSheet()
        actionSheet.frame = UIScreen.main.bounds
        actionSheet.backgroundColor = ZLColor(r: 0, g: 0, b: 0, a: 0.6)
        
        let window = UIApplication.shared.keyWindow
        window?.addSubview(actionSheet)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    // MARK:- 设置UI相关
    private func setupUI() {
        
        addSubview(bgView)
        
        // 上部 分享界面
        bgView.addSubview(topView)
        // 下部取消按钮
        bgView.addSubview(cancelButton)
        // 分享到 标签
        topView.addSubview(shareLabel)
        // 6 个分享按钮的 view
        topView.addSubview(shareButtonView)
        
        topView.snp.makeConstraints { (make) in
            make.bottom.equalTo(cancelButton.snp.top).offset(-kMargin)
            make.left.equalTo(cancelButton.snp.left)
            make.right.equalTo(cancelButton.snp.right)
            make.height.equalTo(shareTopViewH)
        }
        
        cancelButton.snp.makeConstraints { (make) in
            make.left.equalTo(bgView).offset(kMargin)
            make.right.bottom.equalTo(bgView).offset(-kMargin)
            make.height.equalTo(44)
        }
        
        shareLabel.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(topView)
            make.height.equalTo(30)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        UIView.animate(withDuration: kAnimationDuration) {
            self.bgView.y = UI_View_Height - self.bgView.height
        }
    }
    
    // 底部 view
    private lazy var bgView: UIView = {
        let bgView = UIView()
        bgView.frame = CGRect(x: 0, y: UI_View_Height, width: UI_View_Width, height: 280)
        return bgView
    }()
    // 上部 view
    private lazy var topView: UIView = {
        let topView = UIView()
        topView.backgroundColor = UIColor.white
        topView.layer.cornerRadius = kCornerRadius
        topView.layer.masksToBounds = true
        return topView
    }()
    
    // 分享到标签
    private lazy var shareLabel: UILabel = {
        let shareLabel = UILabel()
        shareLabel.text = "分享到"
        shareLabel.textColor = ZLColor(r: 0, g: 0, b: 0, a: 0.7)
        shareLabel.textAlignment = .center
        return shareLabel
    }()
    // 6个按钮
    private lazy var shareButtonView: ZLShareButtonView = {
        let shareButtonView = ZLShareButtonView()
        shareButtonView.frame = CGRect(x: 0, y: 30, width: UI_View_Width - 20, height: shareTopViewH - 30)
        return shareButtonView
    }()
    
    private lazy var cancelButton: UIButton = {
        let cancelButton = UIButton()
        cancelButton.setTitle("取消", for: .normal)
        cancelButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        cancelButton.setTitleColor(ZLColor(r: 37, g: 142, b: 240, a: 1.0), for: .normal)
        cancelButton.backgroundColor = UIColor.white
        cancelButton.addTarget(self, action: #selector(cancelButtonClick), for: .touchUpInside)
        cancelButton.layer.cornerRadius = kCornerRadius
        cancelButton.layer.masksToBounds = true
        return cancelButton
    }()
    
    func cancelButtonClick() {
        UIView.animate(withDuration: kAnimationDuration, animations: {
            self.bgView.y = UI_View_Height
        }) { (_) in
            self.removeFromSuperview()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        UIView.animate(withDuration: kAnimationDuration, animations: {
            self.bgView.y = UI_View_Height
        }) { (_) in
            self.removeFromSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
