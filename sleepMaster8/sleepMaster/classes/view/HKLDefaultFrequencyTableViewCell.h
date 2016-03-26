//
//  HKLDefaultFrequencyTableViewCell.h
//  sleepMaster
//
//  Created by 康隽 on 16/3/25.
//  Copyright © 2016年 康隽. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  默认音频cell
 */
@interface HKLDefaultFrequencyTableViewCell : UITableViewCell
/**所有的数据模型**/
@property (nonatomic,strong)NSArray *allDefaultFrequencyModels;
/**所有的FrequencyView**/
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
