//
//  ViewController.swift
//  LDXAVFoundation
//
//  Created by 刘东旭 on 2017/8/6.
//  Copyright © 2017年 刘东旭. All rights reserved.
//

import UIKit
import AVFoundation
import Foundation

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let avAsset = ldxLoadlocalAsset(name: "video", extr: "mp4")
        let audioAsset = ldxLoadlocalAsset(name: "lvyexianzong", extr: "mp3")
        
        let com = LDXComposition()
        com.addVideoTrack(videoAsset: avAsset, timeRange: LDXTimeRangeMake(start: 1, duration: 15))
        com.addAudioTrack(audioAsset: audioAsset, timeRange: LDXTimeRangeMake(start: 175, duration: 150, timeScale: 10))
        com.addAsset(asset: avAsset, timeRange: LDXTimeRangeMake(start: 160, duration: 150, timeScale: 10))
        
        let layer = UIImageView(image: UIImage(named: "bd_logo1.png")).layer
        layer.frame = CGRect(x: 30, y: 0, width: 120, height: 60)
        let videoWater = LDXVideoWater(waterLayer: layer)
        let videoComposition = LDXVideoComposition(videoSize: com.renderSize(), water: videoWater)
        
        let instruct = LDXVideoCompositionInstruction(timeRange: LDXTimeRangeMake(start: 0, duration: 30),assetTrack: com.videoTrack())
        instruct.addOpacityRamp(fromStartOpacity: 1, toEndOpacity: 0, timeRange: LDXTimeRangeMake(start: 3, duration: 2))
        instruct.addOpacityRamp(1, at: CMTimeMake(6, 1))
        instruct.addOpacityRamp(fromStartOpacity: 0, toEndOpacity: 1, timeRange: LDXTimeRangeMake(start: 8, duration: 1))
        videoComposition.instruction = instruct.instruction
        
        let stringPath = NSHomeDirectory()+"/Documents/123.mp4"
        
        let export = LDXExportComposition(composition: com,videoPath: stringPath)
        export.videoComposition = videoComposition
        export.exportAsynchronously { (path:String) in
            print(path)
        }

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

