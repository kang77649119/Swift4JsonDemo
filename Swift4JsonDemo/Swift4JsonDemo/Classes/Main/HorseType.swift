//
//  HorseType.swift
//  Swift4JsonDemo
//
//  Created by 也许、 on 2017/9/29.
//  Copyright © 2017年 也许、. All rights reserved.
//

import UIKit

class HorseType: NSObject,Codable {

    var bedroom:Int?
    var builtupArea:String?
    var livingroom:Int?
    var price:Double?
    
    required init(from decoder: Decoder) throws {
        let container = try! decoder.container(keyedBy: CodingKeys.self)
        self.bedroom = try? container.decode(Int.self, forKey: HorseType.CodingKeys.bedroom)
        self.builtupArea = try? container.decode(String.self, forKey: HorseType.CodingKeys.builtupArea)
        self.livingroom = try? container.decode(Int.self, forKey: HorseType.CodingKeys.livingroom)
        self.price = try? container.decode(Double.self, forKey: HorseType.CodingKeys.price)
    }

    enum CodingKeys :String, CodingKey {
        case bedroom
        case builtupArea
        case livingroom
        case price
    }
    
}
