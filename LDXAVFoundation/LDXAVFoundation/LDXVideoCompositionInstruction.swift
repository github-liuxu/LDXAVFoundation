//
//  LDXVideoCompositionInstruction.swift
//  LDXAVFoundation
//
//  Created by 刘东旭 on 2017/8/19.
//  Copyright © 2017年 刘东旭. All rights reserved.
//

import Foundation
import AVFoundation

public class LDXVideoCompositionInstruction {
    private let instruct:AVMutableVideoCompositionInstruction
    private let layerInstruction:AVMutableVideoCompositionLayerInstruction
    private var _instruction:[AVVideoCompositionInstructionProtocol] = []
    public var instruction:[AVVideoCompositionInstructionProtocol] {
        get{
            return _instruction
        }
    }
    
    init(timeRange: CMTimeRange,assetTrack track: AVAssetTrack) {
        instruct = AVMutableVideoCompositionInstruction()
        layerInstruction = AVMutableVideoCompositionLayerInstruction(assetTrack: track)
        instruct.timeRange = timeRange
        _instruction.append(instruct)
        instruct.layerInstructions.append(layerInstruction)
    }
    
    public func addInstruction(fromStart:CGAffineTransform,toEnd:CGAffineTransform,timeRange:CMTimeRange) {
        layerInstruction.setTransformRamp(fromStart: fromStart, toEnd: toEnd, timeRange: timeRange)
    }
    
    public func addInstruction(_ transform: CGAffineTransform, at time: CMTime) {
        layerInstruction.setTransform(transform, at: time)
    }
    
    public func addOpacityRamp(fromStartOpacity startOpacity: Float, toEndOpacity endOpacity: Float, timeRange: CMTimeRange) {
        layerInstruction.setOpacityRamp(fromStartOpacity: startOpacity, toEndOpacity: endOpacity, timeRange: timeRange)
    }
    
    public func addOpacityRamp(_ opacity: Float, at time: CMTime) {
        layerInstruction.setOpacity(opacity, at: time)
    }
    
}
