//
//  LDXAssetReader.swift
//  LDXAVFoundation
//
//  Created by 刘东旭 on 2017/9/23.
//  Copyright © 2017年 刘东旭. All rights reserved.
//

import Foundation
import AVFoundation

public class LDXAssetReader {

    private var assetReader:AVAssetReader
    
    init(asset:AVAsset) {
        try! assetReader = AVAssetReader(asset: asset)
        
    }
}
