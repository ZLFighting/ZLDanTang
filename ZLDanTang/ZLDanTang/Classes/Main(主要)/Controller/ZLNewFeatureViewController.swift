//
//  ZLNewFeatureViewController.swift
//  ZLDanTang
//
//  Created by ZL on 2017/8/10.
//  Copyright © 2017年 zhangli. All rights reserved.
//  新特性(引导页)

import UIKit
import SnapKit // 设置约束

let newFeatureID = "newFeatureID"

class ZLNewFeatureViewController: UICollectionViewController {
    
    // 布局对象
    private var layout: UICollectionViewFlowLayout = ZLNewFeatureLayout()
    
    init() {
        super.init(collectionViewLayout: layout)
        collectionView?.showsHorizontalScrollIndicator = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.register(ZLNewFeatureCell.self, forCellWithReuseIdentifier: newFeatureID)
        // Do any additional setup after loading the view.
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// ZLNewfeatureCell
private class ZLNewFeatureCell: UICollectionViewCell {
    private var imageIndex: Int? {
        // 保存图片的索引
        // Swift中被private休息的东西, 如果是在同一个文件中是可以访问的
        didSet {
            iconView.image = UIImage(named: "new_feature_\(imageIndex! + 1)")
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        contentView.addSubview(iconView)
    }
    
    // MARK: - 懒加载
    private lazy var iconView = UIImageView()
    
    private lazy var startButton: UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(UIImage(named: "btn_begin"), for: .normal)
        btn.setBackgroundImage(UIImage(named: "btn_begin"), for: .highlighted)

        btn.addTarget(self, action: #selector(startButtonClick), for: .touchUpInside)
        btn.layer.masksToBounds = true
        btn.isHidden = true
        return btn
    }()
    
    @objc func startButtonClick() {
        // 去主页
        UIApplication.shared.keyWindow?.rootViewController = ZLTabBarController()
    }
}

private class ZLNewFeatureLayout: UICollectionViewFlowLayout {
    
    // 准备布局
    // 什么时候调用? 1.先调用一个有多少行cell 2.调用准备布局 3.调用返回cell
    fileprivate override func prepare() {
        
        // 1.设置layout布局
        itemSize = UIScreen.main.bounds.size
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        scrollDirection = .horizontal
        
        // 2.设置collectionView的属性
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.bounces = false
        collectionView?.isPagingEnabled = true
    }
}

