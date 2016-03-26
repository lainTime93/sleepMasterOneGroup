//
//  HKLDefaultFrequencyModel.m
//  sleepMaster
//
//  Created by 康隽 on 16/3/25.
//  Copyright © 2016年 康隽. All rights reserved.
//

#import "HKLDefaultFrequencyModel.h"

@implementation HKLDefaultFrequencyModel
+(instancetype)creatModelWithDic:(NSDictionary *)dic{
    HKLDefaultFrequencyModel *model= [[self alloc]init];
    [model setValuesForKeysWithDictionary:dic];
    return model;
}
@end
