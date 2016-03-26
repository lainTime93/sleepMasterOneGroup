//
//  HKLDoubleBinauralBeatsMusicModel.m
//  sleepMaster
//
//  Created by 康隽 on 16/3/25.
//  Copyright © 2016年 康隽. All rights reserved.
//

#import "HKLDoubleBinauralBeatsMusicModel.h"

@implementation HKLDoubleBinauralBeatsMusicModel
+(instancetype)creatModelWithDic:(NSDictionary *)dic{
    HKLDoubleBinauralBeatsMusicModel *model= [[self alloc]init];
    [model setValuesForKeysWithDictionary:dic];
    return model;
}
@end
