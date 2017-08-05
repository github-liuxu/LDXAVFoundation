//
//  LDXComposition.swift
//  LDXEditing
//
//  Created by 刘东旭 on 2017/8/6.
//  Copyright © 2017年 刘东旭. All rights reserved.
//

import Foundation
import AVFoundation


public class LDXComposition {
    
    let mutableComposition:AVMutableComposition?
    let mutableVideoCompositionTrack:AVMutableCompositionTrack?
    let mutableAudioCompositionTrack:AVMutableCompositionTrack?
    
    public init() {
        mutableComposition = AVMutableComposition()
        mutableVideoCompositionTrack = mutableComposition?.addMutableTrack(withMediaType: AVMediaTypeVideo, preferredTrackID: kCMPersistentTrackID_Invalid)
        mutableAudioCompositionTrack = mutableComposition?.addMutableTrack(withMediaType: AVMediaTypeAudio, preferredTrackID: kCMPersistentTrackID_Invalid)
    }
    
    public func insertVideoTrack(avAsset:AVAsset,_ldxTimeRange ldxTimeRange:LDXTimeRange) throws {
        let assetVideoTrack = avAsset.tracks(withMediaType: AVMediaTypeVideo)[0]
        let timeRange = LDXTimeRangeToCMTimeRange(ldxTimeRange)
        try mutableVideoCompositionTrack?.insertTimeRange(timeRange, of: assetVideoTrack, at: CMTimeMake(ldxTimeRange.start, 1))
    }
    
    public func insertAudioTrack(avAsset:AVAsset,_ldxTimeRange ldxTimeRange:LDXTimeRange) throws {
        let assetAudioTrack = avAsset.tracks(withMediaType: AVMediaTypeAudio)[0]
        let timeRange = LDXTimeRangeToCMTimeRange(ldxTimeRange)
        try mutableAudioCompositionTrack?.insertTimeRange(timeRange, of: assetAudioTrack, at: CMTimeMake(ldxTimeRange.start, 1))
    }
}
