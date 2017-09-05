//
//  ZLProductDetailBottomView.swift
//  ZLDanTang
//
//  Created by ZL on 2017/9/1.
//  Copyright © 2017年 zhangli. All rights reserved.
//
// 单品详情的scrollView里的-底部滚动区(图文介绍，评论)

import UIKit
import SnapKit // 设置约束

let commentCellID = "commentCellID"

class ZLProductDetailBottomView: UIView, UIWebViewDelegate, UITableViewDataSource, ZLDetailChoiceButtonViewDegegate {
    
    var comments = [ZLComment]()
    
    var product: ZLProduct? {
        didSet {
            weak var weakSelf = self
            // 获取单品详细数据
            ZLProductNetworkTool.shareNetworkTool.loadProductDetailData(id: product!.id!) { (productDetail) in
                weakSelf!.choiceButtonView.commentButton.setTitle("评论(\(productDetail.comments_count!))", for: .normal)
                weakSelf!.webView.loadHTMLString(productDetail.detail_html!, baseURL: nil)
            }
            // 获取评论数据
            ZLProductNetworkTool.shareNetworkTool.loadProductDetailComments(id: product!.id!) { (comments) in
                weakSelf!.comments = comments
                weakSelf!.tableView.reloadData()
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    func setupUI() {
        // 添加顶部选择按钮 view（图文介绍，评论）
        addSubview(choiceButtonView)
        
        addSubview(tableView)
        
        addSubview(webView)
        
        choiceButtonView.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: UI_View_Width, height: 44))
            make.top.equalTo(self)
        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(choiceButtonView.snp.bottom)
            make.left.right.bottom.equalTo(self)
        }
        
        webView.snp.makeConstraints { (make) in
            make.top.equalTo(choiceButtonView.snp.bottom)
            make.left.right.bottom.equalTo(self)
        }
    }
    
    private lazy var webView: UIWebView = {
        let webView = UIWebView()
        /// 自动对页面进行缩放以适应屏幕
        webView.scalesPageToFit = true
        webView.dataDetectorTypes = .all
        webView.delegate = self
        return webView
    }()
    
    private lazy var choiceButtonView: ZLDetailChoiceButtonView = {
        let choiceButtonView = ZLDetailChoiceButtonView.choiceButtonView()
        choiceButtonView.delegate = self
        return choiceButtonView
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.isHidden = true
        let nib = UINib(nibName: String(describing: ZLCommentCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: commentCellID)
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.rowHeight = 64
        return tableView
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ZLDetailChoiceButtonViewDegegate
    func choiceIntroduceButtonClick() {
        print("点击了图文介绍按钮")
        tableView.isHidden = true
        webView.isHidden = false
    }
    
    func choicecommentButtonClick() {
        print("点击了评论按钮")
        tableView.isHidden = false
        webView.isHidden = true
    }
    
    // MARK: - UIWebViewDelegate
    private func webViewDidStartLoad(webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    private func webViewDidFinishLoad(webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: commentCellID) as! ZLCommentCell
        cell.comment = comments[indexPath.row]
        return cell
    }
}

