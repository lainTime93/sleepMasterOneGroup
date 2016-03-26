//
//  AudioPlayerTool.h
//  qqMusic
//
//  Created by 康隽 on 16/3/20.
//  Copyright © 2016年 康隽. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
/**
 *  播放音乐工具
 */
@interface HKLAudioPlayerTool : NSObject
+(AVAudioPlayer*)playMusicWithName:(NSString*)musicName;
+(void)stopMusicWithName:(NSString*)musicName;
+(void)pauseMusicWithName:(NSString*)musicName;
@end
