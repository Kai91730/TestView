//
//  FloatExtensions.swift
//  TestView
//
//  Created by Kai on 2022/1/11.
//

import Foundation

extension Float {
    var clean: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
