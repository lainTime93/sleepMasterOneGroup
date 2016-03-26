//
//  HKLDoubleBinauralBeatsMusicModel.h
//  sleepMaster
//
//  Created by 康隽 on 16/3/25.
//  Copyright © 2016年 康隽. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  双声拍音乐模型 必选一个
 */
@interface HKLDoubleBinauralBeatsMusicModel : NSObject
/**默认图标名称**/
@property (nonatomic,copy)NSString *defaultIconName;
///**选中图标名称**/
//@property (nonatomic,copy)NSString *selectIconName;
/**音频地址**/
@property (nonatomic,copy)NSString *frequencyURLStr;
/**音频名称**/
@property (nonatomic,copy)NSString *frequencyName;
/**
 *  根据字典创建模型对象
 */
+(instancetype)creatModelWithDic:(NSDictionary*)dic;
@end
