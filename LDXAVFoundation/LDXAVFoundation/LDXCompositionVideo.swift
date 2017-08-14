//
//  ComponentVideo.swift
//  LDXAVFoundation
//
//  Created by 刘东旭 on 2017/8/14.
//  Copyright © 2017年 刘东旭. All rights reserved.
//

import Foundation
import AVFoundation

public class LDXCompositionVideo {
    
    public let mutableComposition:AVMutableComposition = AVMutableComposition()
    let mutableVideoCompositionTrack:AVMutableCompositionTrack
    let mutableAudioCompositionTrack:AVMutableCompositionTrack
    var assetVideoTrack:AVAssetTrack?
    var assetAudioTrack:AVAssetTrack?
    var videoCMTime:CMTime
    var audioCMTime:CMTime
    
    init() {
        mutableVideoCompositionTrack = mutableComposition.addMutableTrack(withMediaType: AVMediaTypeVideo, preferredTrackID: kCMPersistentTrackID_Invalid)
        mutableAudioCompositionTrack = mutableComposition.addMutableTrack(withMediaType: AVMediaTypeAudio, preferredTrackID: kCMPersistentTrackID_Invalid)
        videoCMTime = kCMTimeZero
        audioCMTime = kCMTimeZero
    }
    
    public func addVideoTrack(videoAsset:AVAsset) {
        assetVideoTrack = videoAsset.tracks(withMediaType: AVMediaTypeVideo)[0]
        let videoTimeRange = CMTimeRangeMake(kCMTimeZero, videoAsset.duration)
        try! mutableVideoCompositionTrack.insertTimeRange(videoTimeRange, of: assetVideoTrack!, at: videoCMTime)
        videoCMTime = videoAsset.duration + videoCMTime
    }
    
    public func addAudioTrack(audioAsset:AVAsset) {
        assetAudioTrack = audioAsset.tracks(withMediaType: AVMediaTypeAudio)[0]
        let audioTimeRange = CMTimeRangeMake(kCMTimeZero, audioAsset.duration)
        try! mutableAudioCompositionTrack.insertTimeRange(audioTimeRange, of: assetAudioTrack!, at: audioCMTime)
        audioCMTime = audioAsset.duration + audioCMTime
    }
    
    public func addAsset(asset:AVAsset) {
        addVideoTrack(videoAsset: asset)
        addAudioTrack(audioAsset: asset)
    }
    
}

func ldxLoadlocalAsset(name:String,extr:String) -> AVAsset {
    let path = Bundle.main.path(forResource: name, ofType: extr)!
    let asset = AVAsset(url: URL(fileURLWithPath: path))
    return asset
}
