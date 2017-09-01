//
//  ZLProductDetailTopView.swift
//  ZLDanTang
//
//  Created by ZL on 2017/9/1.
//  Copyright © 2017年 zhangli. All rights reserved.
//
// 单品详情的scrollView里的-顶部滚动视图

import UIKit
import SnapKit // 设置约束
import Kingfisher // 缓存图片

let detailCollectionViewCellID = "detailCollectionViewCellID"

class ZLProductDetailTopView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var imageURLs = [String]()
    
    var product: ZLProduct? {
        didSet {
            imageURLs = product!.image_urls!
            collectionView.reloadData()
            pageControl.numberOfPages = imageURLs.count
            titleLabel.text = product!.name
            priceLabel.text = "￥\(product!.price!)"
            describeLabel.text = product!.describe
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(collectionView)
        
        addSubview(pageControl)
        
        addSubview(titleLabel)
        
        addSubview(priceLabel)
        
        addSubview(describeLabel)
        
        pageControl.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.centerY.equalTo(collectionView.snp.bottom).offset(-30)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(collectionView.snp.bottom).offset(5)
            make.left.equalTo(self).offset(5)
            make.right.equalTo(self.snp.right).offset(-5)
            make.height.equalTo(30)
        }
        
        priceLabel.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel.snp.left)
            make.right.equalTo(titleLabel.snp.right)
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.height.equalTo(25)
        }
        
        describeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(priceLabel.snp.left)
            make.right.equalTo(priceLabel.snp.right)
            make.top.equalTo(priceLabel.snp.bottom).offset(5)
            make.bottom.equalTo(self.snp.bottom).offset(-5)
        }
    }
    
    //MARK: - 懒加载
    //MARK: 轮播图广告页
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: UI_View_Width, height: 375), collectionViewLayout: ZLDetailLayout())
        let nib = UINib(nibName: String(describing: ZLDetailCollectionViewCell.self), bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: detailCollectionViewCellID)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        return collectionView
    }()
    
    //MARK: pageControl
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = UIColor.white
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        return pageControl
    }()
    
    //MARK: 标题
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        titleLabel.textColor = UIColor.black
        return titleLabel
    }()
    
    //MARK: 价格
    private lazy var priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.numberOfLines = 0
        priceLabel.textColor = ZLGlobalRedColor()
        priceLabel.font = UIFont.systemFont(ofSize: 16)
        return priceLabel
    }()
    
    //MARK: 描述
    private lazy var describeLabel: UILabel = {
        let describeLabel = UILabel()
        describeLabel.numberOfLines = 0
        describeLabel.textColor = ZLColor(r: 0, g: 0, b: 0, a: 0.6)
        describeLabel.font = UIFont.systemFont(ofSize: 15)
        return describeLabel
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageURLs.count
    }
    
    func collectionView(_ cellForItemAtcollectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailCollectionViewCellID, for: indexPath as IndexPath) as! ZLDetailCollectionViewCell
        let url = imageURLs[indexPath.item]
        cell.bgImageView.kf.setImage(with: URL(string: url)!, placeholder: nil, options: nil, progressBlock: nil) { (image, error, cacheType, imageURL) in
            cell.placeholderButton.isHidden = true
        }
        return cell
    }
    
    private func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: IndexPath) {
        
    }
    
    private func scrollViewDidScroll(scrollView: UIScrollView) {
        let offsetX = scrollView.contentOffset.x
        let page = offsetX / scrollView.width
        pageControl.currentPage = Int(page + 0.5)
    }
}

private class ZLDetailLayout: UICollectionViewFlowLayout {
    // 准备布局
    fileprivate override func prepare() {
        // 设置 layout 布局
        itemSize = CGSize(width: UI_View_Width, height: 375)
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        scrollDirection = .horizontal
        // 设置 contentView 属性
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.bounces = false
        collectionView?.isPagingEnabled = true
    }
}

