//
//  CoffeeShopData.swift
//  TableViewText
//
//  Created by Kai on 2021/12/20.
//

import Foundation

struct CoffeeShopData: Decodable {
    var name: String
    var address: String
    var seatRate: Float
    var openTime: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case address
        case seatRate = "seat"
        case openTime = "open_time"
    }
}
