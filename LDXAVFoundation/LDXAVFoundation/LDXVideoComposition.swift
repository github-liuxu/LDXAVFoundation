//
//  LDXVideoComposition.swift
//  LDXAVFoundation
//
//  Created by 刘东旭 on 2017/8/18.
//  Copyright © 2017年 刘东旭. All rights reserved.
//

import Foundation
import AVFoundation

public class LDXVideoComposition {
    
    var renderSize:CGSize
    var animationTool:AVVideoCompositionCoreAnimationTool
    var _instruction:[AVVideoCompositionInstructionProtocol] = []
    public var instruction:[AVVideoCompositionInstructionProtocol] {
        get{
            return _instruction
        }
        set{
            _instruction = newValue
            videoComposition.instructions = _instruction
        }
    }
    public let videoComposition:AVMutableVideoComposition
    var frameDuration:CMTime = CMTimeMake(1, 30)
    
    
    init(videoSize:CGSize,animation:LDXVideoWater) {
        self.renderSize = videoSize;
        animationTool = animation.animationTool
        videoComposition = AVMutableVideoComposition()
        videoComposition.renderSize = self.renderSize
        videoComposition.frameDuration = self.frameDuration
        videoComposition.animationTool = animationTool
    }
    
}
