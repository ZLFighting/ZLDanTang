//
//  ZLDetailChoiceButtonView.swift
//  ZLDanTang
//
//  Created by ZL on 2017/9/4.
//  Copyright © 2017年 zhangli. All rights reserved.
//
// 单品详情的scrollView里的-底部滚动区(图文介绍，评论)里的-图文介绍,评论按钮工具条

import UIKit

protocol ZLDetailChoiceButtonViewDegegate: NSObjectProtocol {
    // 图文介绍按钮点击
    func choiceIntroduceButtonClick()
    // 评论按钮点击
    func choicecommentButtonClick()
}

class ZLDetailChoiceButtonView: UIView {
    
    weak var delegate: ZLDetailChoiceButtonViewDegegate?

    @IBOutlet weak var lineView: UIView!
    
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var commentButton: UIButton!
    
    @IBAction func introduceButtonClick(sender: UIButton) {
        UIView.animate(withDuration: kAnimationDuration) {
            self.lineView.x = 0
        }
        delegate?.choiceIntroduceButtonClick()
    }
    
    @IBAction func commentButtonClick(sender: UIButton) {
        UIView.animate(withDuration: kAnimationDuration) {
            self.lineView.x = UI_View_Width * 0.5
        }
        delegate?.choicecommentButtonClick()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    class func choiceButtonView() -> ZLDetailChoiceButtonView{
        return Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil)!.last as! ZLDetailChoiceButtonView
    }
    
}
