//
//  RNClipboard.m
//  RNClipboard
//
//  Created by silentcloud on 7/16/15.
//  Copyright (c) 2015 qiang.mou. All rights reserved.
//

#import "RNClipboard.h"
#import "RCTBridge.h"
#import "RCTImageLoader.h"

@import UIKit.UIPasteboard;

@implementation RNClipboard
RCT_EXPORT_MODULE();

@synthesize bridge = _bridge;

RCT_EXPORT_METHOD(get:(RCTResponseSenderBlock)callback)
{
    UIPasteboard *pasteBoard = [UIPasteboard generalPasteboard];
    callback(@[pasteBoard.string ? pasteBoard.string : @""]);
}

RCT_EXPORT_METHOD(set:(NSString *)content)
{
    if (content) {
        UIPasteboard *pasteBoard = [UIPasteboard generalPasteboard];
        pasteBoard.string = content;
    }
}

RCT_EXPORT_METHOD(setImageWithTag:(NSString *)tag
                  successCallback:(RCTResponseSenderBlock)successCallback
                  errorCallback:(RCTResponseErrorBlock)errorCallback)
{
    if (tag) {
        
        [_bridge.imageLoader loadImageWithTag:tag callback:^(NSError *loadError, UIImage *loadedImage) {
            if (loadError) {
                errorCallback(loadError);
                return;
            }
            UIPasteboard *pb = [UIPasteboard generalPasteboard];
            [pb setImage:loadedImage];
            successCallback(@[tag]);
        }];
        
    }
}

@end
