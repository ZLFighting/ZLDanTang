//
//  ZLHomeCell.swift
//  ZLDanTang
//
//  Created by ZL on 2017/8/22.
//  Copyright © 2017年 zhangli. All rights reserved.
//  
// 首页列表数据Cell cell

import UIKit
import Kingfisher // 缓存图片

protocol ZLHomeCellDelegate: NSObjectProtocol {
    func homeCellDidClickedFavoriteButton(button: UIButton)
}


class ZLHomeCell: UITableViewCell {
    
    weak var delegate: ZLHomeCellDelegate?
    
    @IBOutlet weak var bgImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var favoriteBtn: UIButton!
    
    @IBOutlet weak var placeholderBtn: UIButton!
    
    var homeItem: ZLHomeItem? {
        didSet {
            let url = homeItem!.cover_image_url
            bgImageView.kf.setImage(with: URL(string: url!)!, placeholder: nil, options: nil, progressBlock: nil) { (image, error, cacheType, imageURL) in
                self.placeholderBtn.isHidden = true
            }
            titleLabel.text = homeItem!.title
            favoriteBtn.setTitle(" " + String(homeItem!.likes_count!) + " ", for: .normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        favoriteBtn.layer.cornerRadius = favoriteBtn.height * 0.5
        favoriteBtn.layer.masksToBounds = true
        favoriteBtn.layer.rasterizationScale = UIScreen.main.scale
        favoriteBtn.layer.shouldRasterize = true
        bgImageView.layer.cornerRadius = kCornerRadius
        bgImageView.layer.masksToBounds = true
        bgImageView.layer.shouldRasterize = true
        bgImageView.layer.rasterizationScale = UIScreen.main.scale
    }
    
    /// 点击了喜欢按钮
    @IBAction func favoriteButtonClick(sender: UIButton) {
        delegate?.homeCellDidClickedFavoriteButton(button: sender)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
