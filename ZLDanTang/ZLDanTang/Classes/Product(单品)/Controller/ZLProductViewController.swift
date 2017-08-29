//
//  ZLProductViewController.swift
//  ZLDanTang
//
//  Created by ZL on 2017/8/10.
//  Copyright © 2017年 zhangli. All rights reserved.
// 
//  单品界面

import UIKit

let collectionCellID = "ZLCollectionViewCell"

class ZLProductViewController: ZLBaseViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, ZLCollectionViewCellDelegate {
    
    var products = [ZLProduct]()
    
    weak var collectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // 设置collectionView
        setupCollectionView()
        
        weak var weakSelf = self
        ZLProductNetworkTool.shareNetworkTool.loadProductData { (products) in
            weakSelf!.products = products
            weakSelf!.collectionView!.reloadData()
        }
    }
    
    // MARK: - 设置collectionView
    private func setupCollectionView() {
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = view.backgroundColor
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = UINib(nibName: String(describing: ZLCollectionViewCell.self), bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: collectionCellID)
        view.addSubview(collectionView)
        self.collectionView = collectionView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellID, for: indexPath) as! ZLCollectionViewCell
        cell.product = products[indexPath.item]
        cell.delegate = self
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("点击了单品的商品详情")

    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (UIScreen.main.bounds.width - 20) / 2
        let height: CGFloat = 245
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(5, 5, 5, 5)
    }
    
    // MARK: - ZLCollectionViewCellDelegate
    
    func collectionViewCellDidClickedLikeButton(button: UIButton) {
        if !UserDefaults.standard.bool(forKey: isLogin) {
            let loginVC = ZLLoginViewController()
            loginVC.title = "登录"
            let nav = ZLNavigationController(rootViewController: loginVC)
            present(nav, animated: true, completion: nil)
        } else {
            
        }
    }

}
