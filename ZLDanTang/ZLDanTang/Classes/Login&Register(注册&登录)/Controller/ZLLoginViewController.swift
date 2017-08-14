//
//  ZLLoginViewController.swift
//  ZLDanTang
//
//  Created by ZL on 2017/8/14.
//  Copyright © 2017年 zhangli. All rights reserved.
//

import UIKit

class ZLLoginViewController: ZLBaseViewController {
    
    // 手机号
    @IBOutlet weak var mobileField: UITextField!
    // 密码
    @IBOutlet weak var passwordField: UITextField!
    
    // 登录按钮
    @IBOutlet weak var loginButton: UIButton!
    // 忘记密码按钮
    @IBOutlet weak var forgetPwdBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // 设置导航栏的左右按钮
        setupBarButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // 登录点击事件
    @IBAction func loginButtonClick(_ sender: UIButton) {
        UserDefaults.standard.set(true, forKey: isLogin)
        dismiss(animated: true, completion: nil)
    }
    // 忘记密码点击事件
    @IBAction func forgetPwdBtnClick(_ sender: UIButton) {
        print("点击了忘记密码按钮")
    }
    
    // MARK: - 设置导航栏按钮
    private func setupBarButtonItem() {
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "取消", style: .plain, target: self, action: #selector(cancelBtnClick))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "注册", style: .plain, target: self, action: #selector(registerBtnClick))
    }
    
    // 取消按钮点击
    func cancelBtnClick() {
        dismiss(animated: true, completion: nil)
    }
    // 注册按钮点击
    func registerBtnClick() {
        print("点击了注册按钮")
    }
    
    // - 其他社交账号登录
    @IBAction func otherLoginBtnClick(_ sender: UIButton) {
    
        if let buttonType = ZLOtherLoginBtnType(rawValue: sender.tag) {
            switch buttonType {
            case .weiboLogin:
                print("点击了weiboLogin = \(sender.tag)")
                
                break
            case .weChatLogin:
                print("点击了weChatLogin = \(sender.tag)")
                
                break
            case .QQLogin:
                print("点击了QQLogin = \(sender.tag)")
                
                break
            }
        }
    }
    

}
