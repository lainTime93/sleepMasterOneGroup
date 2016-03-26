//
//  HKLCustomMusicModel.h
//  sleepMaster
//
//  Created by 康隽 on 16/3/25.
//  Copyright © 2016年 康隽. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  自定义音频模型，必须包括一个双声拍音频模型，一个对象最多包括6个音乐模型
 */
@interface HKLCustomMusicModel : NSObject
/**保选中的数组音频**/
@property(nonatomic,strong)NSMutableArray *frequencies;
/**选中音频的图标**/
@property(nonatomic,strong)NSMutableArray *icons;
/**混音的封面图片**/
@property(nonatomic,copy)NSString *coverImageName;
/**混音的名称**/
@property (nonatomic,copy)NSString *mixMusicName;
@end
