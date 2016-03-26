//
//  HKLDataManager.m
//  sleepMaster
//
//  Created by 康隽 on 16/3/25.
//  Copyright © 2016年 康隽. All rights reserved.
//

#import "HKLDataManager.h"
#import "HKLDoubleBinauralBeatsMusicModel.h"
#import "HKLMyMusicFrequencyModel.h"
#import "HKLDefaultFrequencyModel.h"
#import "HKLCustomMusicModel.h"
@implementation HKLDataManager
+(NSArray*)creatDoubleBinauralBeatsMousicModel{
    NSString *filePath=[[NSBundle mainBundle]pathForResource:@"DoubleBinauralBeatsMousicModel" ofType:@"plist"];
    NSArray *array=[NSArray arrayWithContentsOfFile:filePath];
    NSMutableArray *allData=[NSMutableArray array];
    for (NSDictionary *dic in array) {
        HKLDoubleBinauralBeatsMusicModel *model=[HKLDoubleBinauralBeatsMusicModel creatModelWithDic:dic];
        [allData addObject:model];
    }
//    NSLog(@"DoubleBinauralBeatsMousicModel**************\n%@",allData);
    return allData;
}
+(NSArray *)creatDefaultFrequencyModel{
    NSString *filePath=[[NSBundle mainBundle]pathForResource:@"DefaultFrequencyModel" ofType:@"plist"];
    NSArray *array=[NSArray arrayWithContentsOfFile:filePath];
    NSMutableArray *allData=[NSMutableArray array];
    for (NSDictionary *dic in array) {
        HKLDefaultFrequencyModel *model=[HKLDefaultFrequencyModel creatModelWithDic:dic];
        [allData addObject:model];
    }
//     NSLog(@"DefaultFrequencyModel***************\n%@",allData);
    return allData;
}
+(NSArray *)creatMyMusicFrequencyModel{
    NSString *filePath=[[NSBundle mainBundle]pathForResource:@"MyMusicFrequencyModel" ofType:@"plist"];
    NSArray *array=[NSArray arrayWithContentsOfFile:filePath];
    NSMutableArray *allData=[NSMutableArray array];
    for (NSDictionary *dic in array) {
        HKLMyMusicFrequencyModel *model=[HKLMyMusicFrequencyModel creatModelWithDic:dic];
        [allData addObject:model];
    }
//     NSLog(@"MyMusicFrequencyModel******************\n%@",allData);
    return allData;
}
@end
