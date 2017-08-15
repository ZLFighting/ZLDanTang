//
//  ZLMeChoiceView.swift
//  ZLDanTang
//
//  Created by ZL on 2017/8/15.
//  Copyright © 2017年 zhangli. All rights reserved.
//  我的界面下 中间喜欢视图(两个按钮分段控件)

import UIKit

class ZLMeChoiceView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI相关
    func setupUI() {
        // 左边的按钮
        addSubview(leftBtn)
        // 右边的按钮
        addSubview(rightBtn)
        // 底部红色条
        addSubview(indicatorView)
        
        leftBtn.snp.makeConstraints { (make) in
            make.left.top.bottom.equalTo(self)
            make.width.equalTo(rightBtn)
        }
        
        rightBtn.snp.makeConstraints { (make) in
            make.left.equalTo(leftBtn.snp.right)
            make.top.right.bottom.equalTo(self)
        }
        
        indicatorView.snp.makeConstraints { (make) in
            make.height.equalTo(kIndicatorViewH)
            make.bottom.left.equalTo(self)
            make.right.equalTo(leftBtn)
        }
    }
    
    // 左边的按钮
    private lazy var leftBtn: UIButton = {
        let leftBtn = UIButton()
        leftBtn.setTitle("喜欢的商品", for: .normal)
        leftBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        leftBtn.setTitleColor(ZLColor(r: 0, g: 0, b: 0, a: 0.7), for: .normal)
        leftBtn.backgroundColor = UIColor.white
        leftBtn.addTarget(self, action: #selector(leftBtnClick), for: .touchUpInside)
        leftBtn.layer.borderColor = ZLColor(r: 230, g: 230, b: 230, a: 1.0).cgColor
        leftBtn.layer.borderWidth = klineWidth
        leftBtn.isSelected = true
        return leftBtn
    }()
    
    // 右边的按钮
    private lazy var rightBtn: UIButton = {
        let rightBtn = UIButton()
        rightBtn.setTitle("喜欢的专题", for: .normal)
        rightBtn.setTitleColor(ZLColor(r: 0, g: 0, b: 0, a: 0.7), for: .normal)
        rightBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        rightBtn.backgroundColor = UIColor.white
        rightBtn.addTarget(self, action: #selector(rightBtnClick), for: .touchUpInside)
        rightBtn.layer.borderColor = ZLColor(r: 230, g: 230, b: 230, a: 1.0).cgColor
        rightBtn.layer.borderWidth = klineWidth
        return rightBtn
    }()
    
    // 底部红色条
    private lazy var indicatorView: UIView = {
        let indicatorView = UIView()
        indicatorView.backgroundColor = ZLGlobalRedColor()
        return indicatorView
    }()
    
    // MARK: - 按钮事件
    func leftBtnClick(button: UIButton) {
        print("点击了喜欢的商品")
        button.isSelected = !button.isSelected
        UIView.animate(withDuration: kAnimationDuration) {
            self.indicatorView.x = 0
        }
    }
    
    func rightBtnClick(button: UIButton) {
        print("点击了喜欢的专题")
        button.isSelected = !button.isSelected
        UIView.animate(withDuration: kAnimationDuration) {
            self.indicatorView.x = UI_View_Width * 0.5
        }
    }

}
