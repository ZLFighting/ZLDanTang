//
//  ZLCommentCell.swift
//  ZLDanTang
//
//  Created by ZL on 2017/9/4.
//  Copyright © 2017年 zhangli. All rights reserved.
//
//  单品详情的scrollView里的-底部滚动条(图文介绍，评论)里的-评论Cell

import UIKit
import Kingfisher // 缓存图片

class ZLCommentCell: UITableViewCell {
    
    var comment: ZLComment? {
        didSet {
            let user = comment!.user
            if let url = user!.avatar_url  {
                avatarImageView.kf.setImage(with: URL(string: url))
            }
            
            nicknameLabel.text = user!.nickname
            contentLabel.text = comment!.content
        }
    }
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var nicknameLabel: UILabel!
    
    @IBOutlet weak var contentLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}

