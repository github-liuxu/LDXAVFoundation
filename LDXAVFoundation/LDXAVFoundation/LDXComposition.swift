//
//  ComponentVideo.swift
//  LDXAVFoundation
//
//  Created by 刘东旭 on 2017/8/14.
//  Copyright © 2017年 刘东旭. All rights reserved.
//

import Foundation
import AVFoundation

public class LDXComposition {
    
    public let mutableComposition:AVMutableComposition = AVMutableComposition()
    private let mutableVideoCompositionTrack:AVMutableCompositionTrack
    private let mutableAudioCompositionTrack:AVMutableCompositionTrack
    private var assetVideoTrack:AVAssetTrack?
    private var assetAudioTrack:AVAssetTrack?
    private var videoCMTime:CMTime
    private var audioCMTime:CMTime
    
    init() {
        mutableVideoCompositionTrack = mutableComposition.addMutableTrack(withMediaType: AVMediaTypeVideo, preferredTrackID: kCMPersistentTrackID_Invalid)
        mutableAudioCompositionTrack = mutableComposition.addMutableTrack(withMediaType: AVMediaTypeAudio, preferredTrackID: kCMPersistentTrackID_Invalid)
        videoCMTime = kCMTimeZero
        audioCMTime = kCMTimeZero
    }
    
    public func addVideoTrack(videoAsset:AVAsset) {
        let videoTimeRange = CMTimeRangeMake(kCMTimeZero, videoAsset.duration)
        addAsset(asset: videoAsset, timeRange: videoTimeRange)
    }
    
    public func addAudioTrack(audioAsset:AVAsset) {
        let audioTimeRange = CMTimeRangeMake(kCMTimeZero, audioAsset.duration)
        addAudioTrack(audioAsset: audioAsset, timeRange: audioTimeRange)
    }
    
    public func addAsset(asset:AVAsset) {
        let videoTimeRange = CMTimeRangeMake(kCMTimeZero, asset.duration)
        addVideoTrack(videoAsset: asset)
        addAudioTrack(audioAsset: asset)
        addAsset(asset: asset, timeRange: videoTimeRange)
    }
    
    public func addVideoTrack(videoAsset:AVAsset, timeRange:CMTimeRange) {
        assetVideoTrack = videoAsset.tracks(withMediaType: AVMediaTypeVideo)[0]
        try! mutableVideoCompositionTrack.insertTimeRange(timeRange, of: assetVideoTrack!, at: videoCMTime)
        videoCMTime = timeRange.duration + videoCMTime
    }
    
    public func addAudioTrack(audioAsset:AVAsset, timeRange:CMTimeRange) {
        assetAudioTrack = audioAsset.tracks(withMediaType: AVMediaTypeAudio)[0]
        try! mutableAudioCompositionTrack.insertTimeRange(timeRange, of: assetAudioTrack!, at: audioCMTime)
        audioCMTime = timeRange.duration + audioCMTime
    }
    
    public func addAsset(asset:AVAsset, timeRange:CMTimeRange) {
        addVideoTrack(videoAsset: asset, timeRange: timeRange)
        addAudioTrack(audioAsset: asset, timeRange: timeRange)
    }
    
    public func videoTrack() -> AVMutableCompositionTrack {
        return mutableVideoCompositionTrack
    }
    
    public func audioTrack() -> AVMutableCompositionTrack {
        return mutableAudioCompositionTrack
    }
    
    public func renderSize() -> CGSize{
        return assetVideoTrack!.naturalSize
    }
    
    public func duration() -> Int64 {
        
        return 0
    }
    
}

func ldxLoadlocalAsset(name:String,extr:String) -> AVAsset {
    let path = Bundle.main.path(forResource: name, ofType: extr)!
    let asset = AVAsset(url: URL(fileURLWithPath: path))
    return asset
}
