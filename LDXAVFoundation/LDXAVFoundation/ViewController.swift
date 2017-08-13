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
        
        let mutableComposition = AVMutableComposition()
        
        let videoPath = Bundle.main.path(forResource: "video", ofType: "mp4")
        let audioPath = Bundle.main.path(forResource: "lvyexianzong", ofType: "mp3")
        let avAsset = AVAsset(url: URL(fileURLWithPath: videoPath!))
        let audioAsset = AVAsset(url: URL(fileURLWithPath: audioPath!))
        
        let mutableVideoCompositionTrack = mutableComposition.addMutableTrack(withMediaType: AVMediaTypeVideo, preferredTrackID: kCMPersistentTrackID_Invalid)
        let mutableAudioCompositionTrack = mutableComposition.addMutableTrack(withMediaType: AVMediaTypeAudio, preferredTrackID: kCMPersistentTrackID_Invalid)
        
        let assetVideoTrack = avAsset.tracks(withMediaType: AVMediaTypeVideo)[0]
        let videoTimeRange = CMTimeRangeMake(kCMTimeZero, avAsset.duration)
        try? mutableVideoCompositionTrack.insertTimeRange(videoTimeRange, of: assetVideoTrack, at: kCMTimeZero)
        
        let assetAudioTrack = audioAsset.tracks(withMediaType: AVMediaTypeAudio)[0]
        let audioTimeRange = CMTimeRangeMake(kCMTimeZero, audioAsset.duration)
        try? mutableAudioCompositionTrack.insertTimeRange(audioTimeRange, of: assetAudioTrack, at: kCMTimeZero)
        
        //        let videoComposition = AVMutableVideoComposition()
        //        videoComposition.renderSize = assetVideoTrack.naturalSize
        //        videoComposition.frameDuration = CMTimeMake(1,30)
        //        let instruction = AVMutableVideoCompositionInstruction()
        //        instruction.timeRange = CMTimeRangeMake(kCMTimeZero, avAsset.duration)
        //
        //        videoComposition.instructions = [instruction]
        
        let export = AVAssetExportSession(asset: mutableComposition, presetName: AVAssetExportPresetHighestQuality)!
        
        let stringPath = NSHomeDirectory()+"/Documents/123.mov"
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: stringPath) {
            try? fileManager.removeItem(atPath: stringPath)
        }
        
        //        export.videoComposition = videoComposition
        export.outputURL = URL(fileURLWithPath: stringPath)
        export.outputFileType = AVFileTypeQuickTimeMovie
        export.shouldOptimizeForNetworkUse = true
        
        export.exportAsynchronously(completionHandler: {
            if export.status == AVAssetExportSessionStatus.completed {
                print(stringPath)
            } else {
                print(export.status)
                print(export.error!)
            }
        })
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

