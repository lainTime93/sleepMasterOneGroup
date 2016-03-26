//
//  HKLDataManager.h
//  sleepMaster
//
//  Created by 康隽 on 16/3/25.
//  Copyright © 2016年 康隽. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  管理数据类
 */
@interface HKLDataManager : NSObject
/**
 *  生成双声拍模型数组给cell显示
 *
 *  @return <#return value description#>
 */
+(NSArray*)creatDoubleBinauralBeatsMousicModel;
/**
 *  生成我的音频模型数组给cell显示
 */
+(NSArray*)creatMyMusicFrequencyModel;
/**
 *  生成默认音频模型数组给cell显示
 */
+(NSArray*)creatDefaultFrequencyModel;
@end
