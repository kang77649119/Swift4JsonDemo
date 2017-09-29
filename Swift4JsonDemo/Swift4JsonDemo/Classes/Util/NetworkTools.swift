//
//  NetworkTools.swift
//  XMGTV
//
//  Created by 也许、 on 2017/8/16.
//  Copyright © 2017年 也许、. All rights reserved.
//

import UIKit
import AFNetworking

enum MethodType {
    case get
    case post
}

class NetworkTools:AFHTTPSessionManager {
    
    class var share:NetworkTools {
        let manager = NetworkTools()
        manager.responseSerializer.acceptableContentTypes?.insert("text/plain")
        return manager
    }
    
    func requestData(type:MethodType, urlStr:String, parameters:[String : Any]?, finishedCallback: @escaping (_ result:Any?, _ errorMsg:String)->()) {
        if type == .get {
            NetworkTools.share.get(urlStr, parameters: parameters, progress: nil, success: { (_, response) in
                finishedCallback(response, "")
            }, failure: { (_, error) in
                finishedCallback(nil, "error")
            })
        } else {
            NetworkTools.share.post(urlStr, parameters: parameters, progress: nil, success: { (_, response) in
                finishedCallback(response, "")
            }, failure: { (_, error) in
                finishedCallback(nil, "error")
            })
        }
        
    }
    
}

