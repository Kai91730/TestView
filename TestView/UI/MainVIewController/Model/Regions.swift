//
//  Regions.swift
//  TestView
//
//  Created by Kai on 2022/1/10.
//

import Foundation

enum Regions: String, CaseIterable {
    
    case taipei = "台北"
    case taoyuan = "桃園"
    case taichung = "台中"
    case kaohsiung = "高雄"
    case pingtung = "屏東"
    
    func text() -> String {
        
        switch self {
        case .taipei:
            return "taipei"
        case .taoyuan:
            return "taoyuan"
        case .taichung:
            return "taichung"
        case .kaohsiung:
            return "kaohsiung"
        case .pingtung:
            return "pingtung"
        }
    }
}
