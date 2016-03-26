//
//  HKLMyMusicFrequency.m
//  sleepMaster
//
//  Created by 康隽 on 16/3/25.
//  Copyright © 2016年 康隽. All rights reserved.
//

#import "HKLMyMusicFrequencyModel.h"

@implementation HKLMyMusicFrequencyModel
+(instancetype)creatModelWithDic:(NSDictionary *)dic{
    HKLMyMusicFrequencyModel *model= [[self alloc]init];
    [model setValuesForKeysWithDictionary:dic];
    return model;
}
@end
