//
//  AudioPlayerTool.m
//  qqMusic
//
//  Created by 康隽 on 16/3/20.
//  Copyright © 2016年 康隽. All rights reserved.
//

#import "HKLAudioPlayerTool.h"

@implementation HKLAudioPlayerTool : NSObject
static NSMutableDictionary *_players;
+(void)initialize
{
    _players=[NSMutableDictionary dictionary];
}
+(AVAudioPlayer*)playMusicWithName:(NSString *)musicName
{
    AVAudioPlayer *player=_players[musicName];
    if (!player) {
        NSURL *url=[[NSBundle mainBundle]URLForResource:musicName withExtension:nil];
   
        player=[[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
        _players[musicName]=player;
        [player prepareToPlay];
    }
    [player play];
    return player;
}
+(void)pauseMusicWithName:(NSString *)musicName
{
    AVAudioPlayer *player=_players[musicName];
    if (player) {
        [player pause];
    }
}
+(void)stopMusicWithName:(NSString *)musicName
{
    AVAudioPlayer *player=_players[musicName];
    if (player) {
        [player stop];
        [_players removeObjectForKey:musicName];
        player=nil;
    }
}

@end
