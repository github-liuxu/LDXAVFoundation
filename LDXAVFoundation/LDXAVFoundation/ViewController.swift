//
//  ViewController.swift
//  LDXAVFoundation
//
//  Created by 刘东旭 on 2017/8/6.
//  Copyright © 2017年 刘东旭. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let avAsset = ldxLoadlocalAsset(name: "video", extr: "mp4")
        let audioAsset = ldxLoadlocalAsset(name: "lvyexianzong", extr: "mp3")
        
        let com = LDXCompositionVideo()
        com.addVideoTrack(videoAsset: avAsset)
        com.addVideoTrack(videoAsset: avAsset)
        com.addAudioTrack(audioAsset: audioAsset)
        
        //        let videoComposition = AVMutableVideoComposition()
        //        videoComposition.renderSize = assetVideoTrack.naturalSize
        //        videoComposition.frameDuration = CMTimeMake(1,30)
        //        let instruction = AVMutableVideoCompositionInstruction()
        //        instruction.timeRange = CMTimeRangeMake(kCMTimeZero, avAsset.duration)
        //
        //        videoComposition.instructions = [instruction]
        
        
        let stringPath = NSHomeDirectory()+"/Documents/123.mp4"
        
        let export = LDXExportComposition(compositionVideo: com,videoPath: stringPath)
        export.exportAsynchronously { (path:String) in
            print(path)
        }

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

