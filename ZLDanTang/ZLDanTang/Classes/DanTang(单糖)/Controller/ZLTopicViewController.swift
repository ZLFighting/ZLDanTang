//
//  ZLTopicViewController.swift
//  ZLDanTang
//
//  Created by ZL on 2017/8/22.
//  Copyright © 2017年 zhangli. All rights reserved.
//
// 单糖子控制器

import UIKit

let homeCellID = "homeCellID"

class ZLTopicViewController: UITableViewController, ZLHomeCellDelegate {
    
    var type = Int()

    /// 首页列表数据
    var items = [ZLHomeItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = ZLGlobalColor()
        setupTableView()
        
        // 添加刷新控件
        refreshControl?.addTarget(self, action: #selector(loadHomeData), for: .valueChanged)
        // 获取首页数据
        weak var weakSelf = self
        ZLDanTangNetworkTool.shareNetworkTool.loadHomeInfo(id: type) { (homeItems) in
            weakSelf!.items = homeItems
            weakSelf!.tableView!.reloadData()
        }
    }
    
    func loadHomeData() {
        // 获取首页数据
        weak var weakSelf = self
        ZLDanTangNetworkTool.shareNetworkTool.loadHomeInfo(id: type) { (homeItems) in
            weakSelf!.items = homeItems
            weakSelf!.tableView!.reloadData()
            weakSelf!.refreshControl?.endRefreshing()
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - 设置TableView相关
    func setupTableView() {
        tableView.rowHeight = 160
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsetsMake(kTitlesViewY + kTitlesViewH, 0, tabBarController!.tabBar.height, 0)
        tableView.scrollIndicatorInsets = tableView.contentInset
        let nib = UINib(nibName: String(describing: ZLHomeCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: homeCellID)
    }
    
    // MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let homeCell = tableView.dequeueReusableCell(withIdentifier: homeCellID) as! ZLHomeCell
        homeCell.selectionStyle = .none
        homeCell.homeItem = items[indexPath.row]
        homeCell.delegate = self
        return homeCell
    }
    
    // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("点击了攻略详情")
        
        let detailVC = ZLDetailViewController()
        detailVC.homeItem = items[indexPath.row]
        detailVC.title = "攻略详情"
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    // MARK: - ZLHomeCellDelegate
    func homeCellDidClickedFavoriteButton(button: UIButton) {
        if !UserDefaults.standard.bool(forKey: isLogin) {
            let loginVC = ZLLoginViewController()
            loginVC.title = "登录"
            let nav = ZLNavigationController(rootViewController: loginVC)
            present(nav, animated: true, completion: nil)
        } else {
            
        }
    }

}
