//
//  LDXCMTimeRange.swift
//  LDXAVFoundation
//
//  Created by 刘东旭 on 2017/8/16.
//  Copyright © 2017年 刘东旭. All rights reserved.
//

import Foundation
import AVFoundation

/*!
	start :从第几秒开始
    duration :持续几秒的范围
    返回CMTimeRange
 */
public func LDXTimeRangeMake(start:Int64,duration:Int64) -> CMTimeRange{
    return LDXTimeRangeMake(start: start, duration: duration, timeScale: 1)
}

/*!
	start :从第几秒开始
    duration :持续几秒
    timeScale :时间缩放系数
    例如 :LDXTimeRangeMake(start:5,duration:20,timeScale:10) 即从0.5秒开始持续2秒的范围
    返回CMTimeRange
 */
public func LDXTimeRangeMake(start:Int64,duration:Int64,timeScale:Int32) -> CMTimeRange{
    return CMTimeRangeMake(start: CMTimeMake(value: start, timescale: timeScale), duration: CMTimeMake(value: duration, timescale: timeScale))
}
