//
//  ZLCollectionViewCell.swift
//  ZLDanTang
//
//  Created by ZL on 2017/8/29.
//  Copyright © 2017年 zhangli. All rights reserved.
//
// 单品界面的瀑布流cell

import UIKit
import Kingfisher // 缓存图片

protocol ZLCollectionViewCellDelegate: NSObjectProtocol {
    func collectionViewCellDidClickedLikeButton(button: UIButton)
}

class ZLCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: ZLCollectionViewCellDelegate?
    
    var result: ZLSearchResult? {
        didSet {
            let url = result!.cover_image_url!
            productImageView.kf.setImage(with: URL(string: url)!, placeholder: nil, options: nil, progressBlock: nil) { (image, error, cacheType, imageURL) in
                self.placeholderBtn.isHidden = true
            }
            likeButton.setTitle(" " + String(result!.favorites_count!) + " ", for: .normal)
            titleLabel.text = result!.name
            priceLabel.text = "￥" + String(result!.price!)
        }
    }
    
    
    var product: ZLProduct? {
        didSet {
            let url = product!.cover_image_url!
            productImageView.kf.setImage(with: URL(string: url)!, placeholder: nil, options: nil, progressBlock: nil) { (image, error, cacheType, imageURL) in
                self.placeholderBtn.isHidden = true
            }
            likeButton.setTitle(" " + String(product!.favorites_count!) + " ", for: .normal)
            titleLabel.text = product!.name
            priceLabel.text = "￥" + String(product!.price!)
        }
    }
    // 占位图片
    @IBOutlet weak var placeholderBtn: UIButton!
    // 背景图片
    @IBOutlet weak var productImageView: UIImageView!
    // 标题
    @IBOutlet weak var titleLabel: UILabel!
    // 价格
    @IBOutlet weak var priceLabel: UILabel!
    // 喜欢按钮
    @IBOutlet weak var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @IBAction func likeButtonClick(sender: UIButton) {
        delegate?.collectionViewCellDidClickedLikeButton(button: sender)
    }
}

