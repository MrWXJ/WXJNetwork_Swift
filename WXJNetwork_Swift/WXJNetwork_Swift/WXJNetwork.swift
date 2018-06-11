//
//  WXJNetwork.swift
//  WXJNetwork_swift
//
//  Created by MrWXJ on 2018/6/11.
//  Copyright © 2018年 MrWXJ. All rights reserved.
//

import UIKit

enum WXJHTTPMethod {
    case Get//GET
    case Post//POST
}

class WXJNetwork: NSObject {
    /// 成功时
    typealias NetworkSucces = (_ data:Any) -> ()
    
    /// 失败时
    typealias NetworkFaile = (_ error:Error) -> ()
    
    /// 创建一次
    static let shareNetwork = WXJNetwork()
    
    func initWXJNetWork(method:WXJHTTPMethod,urlString:String,parameter:String,cookieBool:Bool,success:@escaping NetworkSucces,faile:@escaping NetworkFaile) {
        let urlStr: NSURL = NSURL(string: urlString as String)!
        var request = URLRequest(url:urlStr as URL)
        
        if method == WXJHTTPMethod.Get {
            request.httpMethod = "GET"
        } else {
            request.httpMethod = "POST"
        }
        request.timeoutInterval = 10
        if cookieBool == true {
            let string = NSString(format:UserDefaults.standard.object(forKey: "cookie") as! NSString)
            request.setValue(string as String, forHTTPHeaderField: "cookie")
        }
        
        let data = parameter.data(using: String.Encoding.utf8)
        request.httpBody = data
        let dataTask = URLSession.shared.dataTask(with: request,completionHandler: {(data, response, error) -> Void in
            if error == nil {
                let jsonObj = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! NSArray
                success(jsonObj)
            } else {
                faile(error!)
            }
        }) as URLSessionTask
        //使用resume方法启动任务
        dataTask.resume()
    }
   
}
