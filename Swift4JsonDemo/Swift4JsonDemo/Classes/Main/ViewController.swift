//
//  ViewController.swift
//  Swift4JsonDemo
//
//  Created by 也许、 on 2017/9/29.
//  Copyright © 2017年 也许、. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let url = "http://120.76.205.241:8000/house/youyouhaofang?cityid=7&type=2&kw=%E8%83%A1%E5%90%8C&apikey=6PGmEHLZr6KwBHXYChXEJzp9dwCPFJU9gGkWmIxgb27Sd0tqHVpVLHf135cuxOec"
    
    let decoder = JSONDecoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }

}

extension ViewController {
    
    func loadData() {
        NetworkTools.share.requestData(type: .get, urlStr: url, parameters: nil) { (response, errorMsg) in

            guard let json = response as? [String : Any] else {
                print("解析失败1")
                return
            }
            
            guard let code = json["retcode"] as? String else {
                print("解析失败2")
                return
            }
            
            if code == "000000" {
                guard let dataJson = json["data"] as? [[String : Any]] else {
                    print("解析失败3")
                    return
                }
                
                guard let data = try? JSONSerialization.data(withJSONObject: dataJson, options: JSONSerialization.WritingOptions.prettyPrinted), let models = try? self.decoder.decode([HorseModel].self, from: data) else {
                    print("转data或转模型失败")
                    return
                }
                for model in models {
                    print(model.address, model.city, model.completeDate, model.horsePoint?.lat, model.flatOptions?.first?.price)
                }
                
            }
            
        }
    }
    
}

