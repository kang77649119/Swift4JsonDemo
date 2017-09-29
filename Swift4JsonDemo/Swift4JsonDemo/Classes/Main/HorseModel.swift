//
//  HorseModel.swift
//  Swift4JsonDemo
//
//  Created by 也许、 on 2017/9/29.
//  Copyright © 2017年 也许、. All rights reserved.
//

import UIKit

class HorseModel: NSObject, Codable {
    
    // 需要的属性
    var address:String?
    var city:String?
    var completeDate:String?
    var courtName:String?
    var imageUrls:[String]?
    
    // 嵌套属性
    var flatOptions:[HorseType]?
    
    // 与字典中属性不同名,需要在 CodingKeys 中设置映射名称
    var horsePoint:HorsePoint?
    
    // 自定义属性
    var test:String?
    
    /**
     tip1:
         如果模型中的属性不包含自定义属性,可以不用实现 required init(from: Decoder) 直接转模型就可以
         如果模型中包含了自定义属性,必须实现 required init(from: Decoder) 并且在内部对每个属性进行取值赋值,自定义属性根据需要可以选择赋值也可以不赋值
     
     tip2:
         如果返回的字典中的字段属性不符合模型中的属性规范,可以在 CodingKeys 中设置该字段的映射名称
     
     */
    
    required init(from: Decoder) {

        let decoder = try! from.container(keyedBy: CodingKeys.self)
        self.address = try? decoder.decode(String.self, forKey: HorseModel.CodingKeys.address)
        self.city = try? decoder.decode(String.self, forKey: HorseModel.CodingKeys.city)
        self.courtName = try? decoder.decode(String.self, forKey: HorseModel.CodingKeys.courtName)
        self.imageUrls = try? decoder.decode(Array.self, forKey: HorseModel.CodingKeys.imageUrls)
        self.completeDate = try? decoder.decode(String.self, forKey: HorseModel.CodingKeys.completeDate)

        self.horsePoint = try? decoder.decode(HorsePoint.self, forKey: HorseModel.CodingKeys.horsePoint)
        self.flatOptions = try? decoder.decode([HorseType].self, forKey: HorseModel.CodingKeys.flatOptions)

    }

    enum CodingKeys:String, CodingKey {
        case address
        case city
        case completeDate
        case courtName
        case imageUrls
        case horsePoint = "geoPoint"
        case flatOptions
    }


}


























