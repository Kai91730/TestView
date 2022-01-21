//
//  Regions.swift
//  TestView
//
//  Created by Kai on 2022/1/10.
//

import Foundation

enum Regions: String {
    
    case taipei = "台北"
    case taichung = "台中"
    case kaohsiung = "高雄"
    
    func text() -> String {
        
        switch self {
        case .taipei:
            return "taipei"
        case .taichung:
            return "taichung"
        case .kaohsiung:
            return "kaohsiung"
        }
    }
}
