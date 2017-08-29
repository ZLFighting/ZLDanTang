//
//  ZLRefreshView.swift
//  ZLDanTang
//
//  Created by ZL on 2017/8/23.
//  Copyright © 2017年 zhangli. All rights reserved.
//  下拉刷新控件

import UIKit

class ZLRefreshView: UIView {
    
    @IBOutlet weak var arrowIcon: UIImageView!
    
    @IBOutlet weak var tipView: UIView!
    
    @IBOutlet weak var loadingView: UIImageView!
    
    // 旋转箭头
    func rotationArrowIcon(flag: Bool) {
        var angle = Double.pi
        angle += flag ? -0.01 : 0.01
        UIView.animate(withDuration: kAnimationDuration) {
            self.arrowIcon.transform = self.arrowIcon.transform.rotated(by: CGFloat(angle))
        }
    }
    
    // 开始转圈动画
    func startLodingViewAnimation() {
        
        tipView.isHidden = true
        // 创建动画
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.toValue = 2 * Double.pi
        animation.duration = 1
        animation.repeatCount = MAXFLOAT
        animation.isRemovedOnCompletion = false
        loadingView.layer.add(animation, forKey: nil)
    }
    
    // 停止转圈动画
    func stopLodingViewAnimation() {
        tipView.isHidden = false
        loadingView.layer.removeAllAnimations()
    }
    
    class func refreshView() -> ZLRefreshView {
        return Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil)!.last as! ZLRefreshView
    }

}
