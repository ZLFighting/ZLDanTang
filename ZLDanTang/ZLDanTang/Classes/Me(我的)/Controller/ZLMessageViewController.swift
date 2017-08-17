//
//  ZLMessageViewController.swift
//  ZLDanTang
//
//  Created by ZL on 2017/8/16.
//  Copyright © 2017年 zhangli. All rights reserved.
//  消息控制器

import UIKit

let messageCellID = "messageCellID"

class ZLMessageViewController: ZLBaseViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }
    
    // MARK: - tableview 相关
    private func setupTableView() {
        
        let tableView = UITableView()
        tableView.frame = view.bounds;
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: messageCellID)
        tableView.tableFooterView = UIView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: messageCellID)
        cell?.textLabel?.text = "消息---" + String(indexPath.row)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
