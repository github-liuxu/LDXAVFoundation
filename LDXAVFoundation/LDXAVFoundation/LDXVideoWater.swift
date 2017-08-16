//
//  LDXVideoAddWater.swift
//  LDXAVFoundation
//
//  Created by 刘东旭 on 2017/8/16.
//  Copyright © 2017年 刘东旭. All rights reserved.
//

import Foundation
import AVFoundation
import QuartzCore

public class LDXVideoWater {
    
    public var animationTool:AVVideoCompositionCoreAnimationTool {
        get{
            return self.animationTool
        }
        set{
            self.animationTool = newValue
        }
    }
    
    
    init(renderSize:CGSize,waterLayer:CALayer,layerPosition:CGPoint) {
        
        let parentLayer = CALayer()
        let videoLayer = CALayer()
        
        parentLayer.frame = CGRect(x:0,y:0,width:renderSize.width,height:renderSize.height)
        videoLayer.frame = CGRect(x:0,y:0,width:renderSize.width,height:renderSize.height)
        
        parentLayer.addSublayer(videoLayer)
        waterLayer.position = layerPosition
        parentLayer.addSublayer(waterLayer)
        
        animationTool = AVVideoCompositionCoreAnimationTool(postProcessingAsVideoLayer: videoLayer, in: parentLayer)
    }
}
