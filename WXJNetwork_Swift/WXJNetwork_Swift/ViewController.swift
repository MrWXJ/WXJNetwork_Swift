//
//  ViewController.swift
//  WXJNetwork_Swift
//
//  Created by 吴显吉 on 2018/6/11.
//  Copyright © 2018年 MrWXJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        WXJNetwork.shareNetwork.initWXJNetWork(method: WXJHTTPMethod.Post, urlString: "http://www.24hmart.cn:8081/comm/noticeAppIndex", parameter: "depId=8510305&page=1&pageSize=1", cookieBool: false, success: { (data) in
            //读取到数据的时候
            print(data)
        }) { (error) in
            //当错误的时候
            print(error.localizedDescription)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

