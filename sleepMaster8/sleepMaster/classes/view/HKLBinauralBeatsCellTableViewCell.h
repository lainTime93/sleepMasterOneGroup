//
//  HKLBinauralBeatsCellTableViewCell.h
//  sleepMaster
//
//  Created by 康隽 on 16/3/25.
//  Copyright © 2016年 康隽. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  混音界面的cell
 */
@interface HKLBinauralBeatsCellTableViewCell : UITableViewCell
/**
 *  所有的双声拍数据数组
 */
@property(nonatomic,strong)NSMutableArray *allDoubleBinauralBeatsModels;
/**
 *  cell的所有FrequencyView数组
 */
@property(nonatomic,strong)NSMutableArray *allFrequencyViews;
/**
 *   根据数据创建cell视图
 *
 *  @param allModelData cell所需要的数据
 *
 *  @return 返回cell实例
 */
-(instancetype)initWithData:(NSMutableArray*)allModelData;
@end
