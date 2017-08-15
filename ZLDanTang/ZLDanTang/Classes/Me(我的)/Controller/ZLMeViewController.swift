//
//  ZLMeViewController.swift
//  ZLDanTang
//
//  Created by ZL on 2017/8/10.
//  Copyright © 2017年 zhangli. All rights reserved.
//  我的控制器

import UIKit

class ZLMeViewController: ZLBaseViewController , UITableViewDataSource, UITableViewDelegate {
    
    var cellCount = 0
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 隐藏导航栏标题
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    // MARK: - 创建 tableView
    private func setupTableView() {
        let tableView = UITableView()
        tableView.frame = view.bounds
        view.addSubview(tableView)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableHeaderView = headerView
        tableView.tableFooterView = footerView
    }
    
    // MARK: - headerView
    private lazy var headerView: ZLMineHeaderView = {
        let headerView = ZLMineHeaderView()
        headerView.frame = CGRect(x: 0, y: 0, width: UI_View_Width, height: kMineHeaderImageHeight)
        // 添加点击事件
        headerView.iconButton.addTarget(self, action: #selector(iconButtonClick), for: .touchUpInside)
        headerView.messageButton.addTarget(self, action: #selector(messageButtonClick), for: .touchUpInside)
        headerView.settingButton.addTarget(self, action: #selector(settingButtonClick), for: .touchUpInside)
        return headerView
    }()
    
    // MARK: 头部按钮点击
    func iconButtonClick() {
        // 判断是否登录
        if UserDefaults.standard.bool(forKey: isLogin) {
            let actionSheet = UIAlertController(title: "", message: nil, preferredStyle: .actionSheet)
            let cameraAction = UIAlertAction(title: "编辑资料", style: .default, handler: { (_) in
                
            })
            let photoAction = UIAlertAction(title: "退出登录", style: .destructive, handler: { (_) in
                UserDefaults.standard.set(false, forKey: isLogin)
            })
            let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
            actionSheet.addAction(cancelAction)
            actionSheet.addAction(cameraAction)
            actionSheet.addAction(photoAction)
            self.present(actionSheet, animated: true, completion: nil)
        } else {
            let loginVC = ZLLoginViewController()
            loginVC.title = "登录"
            let nav = ZLNavigationController(rootViewController: loginVC)
            present(nav, animated: true, completion: nil)
        }
    }
    
    func messageButtonClick() { // 消息
        print("点击了消息")
    }
    
    func settingButtonClick() { // 设置
        print("点击了设置")
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    // MARK: - 底部
    private lazy var footerView: ZLMeFooterView = {
        let footerView = ZLMeFooterView(frame: CGRect(x: 0, y: 0, width: UI_View_Width, height: 200))
        return footerView
    }()
    
    // MARK: - 分区header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let choiceView = ZLMeChoiceView()

        return choiceView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY < 0 {
            var tempFrame = headerView.bgImageView.frame
            tempFrame.origin.y = offsetY
            tempFrame.size.height = kMineHeaderImageHeight - offsetY
            headerView.bgImageView.frame = tempFrame
        }
    }

}
