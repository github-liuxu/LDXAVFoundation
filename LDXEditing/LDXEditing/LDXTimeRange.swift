//
//  LDXTimeRange.swift
//  LDXEditing
//
//  Created by 刘东旭 on 2017/8/6.
//  Copyright © 2017年 刘东旭. All rights reserved.
//

import Foundation

public struct LDXTimeRange {
    
    var start:Int64
    var duration:Int64
    
    public init(start: Int64, duration: Int64) {
        self.start = start
        self.duration = duration
    }
}

public func LDXTimeRangeMake(_ start: Int64, _ duration: Int64) -> LDXTimeRange {
    return LDXTimeRange.init(start: start, duration: duration)
}
