//
//  LDXVideoAddWater.swift
//  LDXAVFoundation
//
//  Created by 刘东旭 on 2017/8/16.
//  Copyright © 2017年 刘东旭. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

public class LDXVideoWater {
    
    private let parentLayer = CALayer()
    private let videoLayer = CALayer()
    public var animationTool:AVVideoCompositionCoreAnimationTool?
    private var _waterLayer:CALayer = CALayer()
    private var _position:CGPoint = CGPoint()
    
    
    public var waterLayer:CALayer {
        get{
            return _waterLayer
        }
        set{
            _waterLayer = newValue
            setWaterPosition(rect: _waterLayer.frame)
        }
    }
    
    public var position:CGPoint {
        get{
            return _position
        }
        set{
            _position = newValue
            _waterLayer.position = _position
        }
    }
    
    
    init(waterLayer:CALayer) {
        self.waterLayer = waterLayer
        setWaterPosition(rect: waterLayer.frame)
    }
    
    init(image:UIImage) {
        let imageView = UIImageView(image: image)
        waterLayer = imageView.layer
        setWaterPosition(rect: CGRect(origin: CGPoint(x: 0, y: 0), size: image.size))
    }
    
    public func animationToolRenderSize(videoLayerRenderSize:CGSize) -> AVVideoCompositionCoreAnimationTool {
        parentLayer.frame = CGRect(x:0,y:0,width:videoLayerRenderSize.width,height:videoLayerRenderSize.height)
        parentLayer.backgroundColor = UIColor.clear.cgColor
        videoLayer.frame = CGRect(x:0,y:0,width:videoLayerRenderSize.width,height:videoLayerRenderSize.height)
        videoLayer.backgroundColor = UIColor.clear.cgColor
        parentLayer.addSublayer(videoLayer)
        parentLayer.addSublayer(waterLayer)
        animationTool = AVVideoCompositionCoreAnimationTool(postProcessingAsVideoLayer: videoLayer, in: parentLayer)
        return animationTool!
    }
    
    public func waterFrame(rect:CGRect) {
        setWaterPosition(rect: rect)
    }
    
    public func waterSize(size:CGSize) {
        waterLayer.frame.size = size
        waterLayer.position = waterLayer.position
    }

    private func setWaterPosition(rect:CGRect) {
        position = CGPoint(x: rect.origin.x+rect.width/2, y: rect.origin.y+rect.height/2)
        waterLayer.position = position
    }
}
