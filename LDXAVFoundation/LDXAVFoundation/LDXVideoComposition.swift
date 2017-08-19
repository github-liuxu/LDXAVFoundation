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
    
    private var renderSize:CGSize
    var animationTool:AVVideoCompositionCoreAnimationTool?
    private var _instruction:[AVVideoCompositionInstructionProtocol] = []
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
    
    init(videoSize:CGSize,water:LDXVideoWater?) {
        self.renderSize = videoSize;
        videoComposition = AVMutableVideoComposition()
        videoComposition.renderSize = self.renderSize
        videoComposition.frameDuration = self.frameDuration
        if water != nil {
            //系统默认animationTool的layer坐标y是从底部向上逐渐变大，所以要转换一下
            water!.position = CGPoint(x: water!.position.x, y: videoSize.height-water!.position.y)
            //设置视频图层的size
            animationTool = water!.animationToolRenderSize(videoLayerRenderSize: videoSize)
            videoComposition.animationTool = animationTool
        }
    }
    
}
