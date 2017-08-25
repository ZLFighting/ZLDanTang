//
//  ZLSettingViewController.swift
//  ZLDanTang
//
//  Created by ZL on 2017/8/17.
//  Copyright © 2017年 zhangli. All rights reserved.
//  设置控制器

import UIKit

let settingCellID = "settingCellID"

class ZLSettingViewController: ZLBaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    var settings = [AnyObject]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // 从 plist 文件在加载数据
        configCellFromPlist()
        
        setupTableView()
    }
    
    // MARK: - 从 plist 文件在加载数据
    func configCellFromPlist() {
        let path = Bundle.main.path(forResource: "SettingCell", ofType: ".plist")
        let settingsPlist = NSArray.init(contentsOfFile: path!)
        for arrayDict in settingsPlist! {
            let array = arrayDict as! NSArray
            var sections = [AnyObject]()
            for dict in array {
                let setting = ZLSettingModel(dict: dict as! [String: AnyObject])
                sections.append(setting)
            }
            settings.append(sections as AnyObject)
        }
    }
    
    // MARK: - tableview 相关
    // 创建 tableView
    private func setupTableView() {
        let tableView = UITableView()
        tableView.frame = view.bounds
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.rowHeight = 44
        let nib = UINib(nibName: String(describing: ZLSettingCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: settingCellID)
        tableView.tableFooterView = UIView()
    }
    
    // tableview 分区数目
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return settings.count
    }
    
    // tableview 每个分区的行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let setting = settings[section] as! [ZLSettingModel]
        return setting.count
    }
    
    // 数据源
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: settingCellID) as! ZLSettingCell
        let setting = settings[indexPath.section] as! [ZLSettingModel]
        cell.setting = setting[indexPath.row]
        return cell
    }
    
    // 分区头部视图高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return kMargin + 5
    }
    
    // 点击cell 操作事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: settingCellID) as! ZLSettingCell
        let setting = settings[indexPath.section] as! [ZLSettingModel]
        cell.setting = setting[indexPath.row]

        print("点击了 = \(String(describing: cell.setting?.leftTitle))")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
