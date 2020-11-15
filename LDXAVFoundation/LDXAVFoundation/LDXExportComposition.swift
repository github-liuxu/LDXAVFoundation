//
//  LDXExportComponent.swift
//  LDXAVFoundation
//
//  Created by 刘东旭 on 2017/8/14.
//  Copyright © 2017年 刘东旭. All rights reserved.
//

import Foundation
import AVFoundation

public class LDXExportComposition {
    
    private var videoPath:String
    private let exportSession:AVAssetExportSession
    private var _videoComposition:LDXVideoComposition?
    private var progress:((_ progress:Float)->Swift.Void)?
    
    public var videoComposition:LDXVideoComposition {
        get{
            return _videoComposition!
        }
        set{
            _videoComposition = newValue
            exportSession.videoComposition = _videoComposition?.videoComposition
        }
    }
    
    init(composition:LDXComposition,videoPath:String) {
        self.videoPath = videoPath
        exportSession = AVAssetExportSession(asset: composition.mutableComposition, presetName: AVAssetExportPresetHighestQuality)!
        exportSession.outputFileType = AVFileType.mp4
        exportSession.shouldOptimizeForNetworkUse = true
        exportSession.outputURL = URL(fileURLWithPath: self.videoPath)
    }
    
    public func exportAsynchronously(_ progress: @escaping (_ progress:Float) -> Swift.Void,completionHandler handler: @escaping (_ path:String) -> Swift.Void) {
        self.progress = progress
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: videoPath) {
            try! fileManager.removeItem(atPath: videoPath)
        }
        
        let timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(progressCallBack), userInfo: nil, repeats: true)
        timer.fire()
        
        exportSession.exportAsynchronously { 
            if self.exportSession.status == AVAssetExportSession.Status.completed {
                handler(self.videoPath)
            } else {
                print(self.exportSession.status)
                print(self.exportSession.error!)
            }
            timer.invalidate()
        }
        
    }
    
    @objc private func progressCallBack() {
        self.progress!(exportSession.progress)
    }
    
    
}
