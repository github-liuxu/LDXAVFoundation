//
//  LDXTransformTimeRange.swift
//  LDXEditing
//
//  Created by 刘东旭 on 2017/8/6.
//  Copyright © 2017年 刘东旭. All rights reserved.
//

import Foundation
import AVFoundation

public class LDXTimeRangeTransform {
    
    var ldxTimeRange:LDXTimeRange
    
    public init(_ ldxTimeRange:LDXTimeRange) {
        self.ldxTimeRange = ldxTimeRange
    }
    
    public func getCMTimeRange() -> CMTimeRange {
        return CMTimeRangeMake(CMTimeMake(ldxTimeRange.start, 1), CMTimeMake(ldxTimeRange.duration, 1))
    }
}

public func LDXTimeRangeToCMTimeRange(_ ldxTimeRange:LDXTimeRange) ->CMTimeRange {
    
    let ldxTimeRangeTransform = LDXTimeRangeTransform.init(ldxTimeRange)
    
    return ldxTimeRangeTransform.getCMTimeRange()
}
