//
//  ZLRegisterViewController.swift
//  ZLDanTang
//
//  Created by ZL on 2017/8/15.
//  Copyright © 2017年 zhangli. All rights reserved.
//

import UIKit

class ZLRegisterViewController: ZLBaseViewController {

    
    @IBOutlet weak var mobileField: UITextField!
    
    @IBOutlet weak var vertifyButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mobileField.becomeFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
