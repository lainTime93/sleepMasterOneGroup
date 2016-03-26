//
//  HKLMyFrequencyTableViewCell.h
//  sleepMaster
//
//  Created by 康隽 on 16/3/25.
//  Copyright © 2016年 康隽. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  我的音频cell
 */
@interface HKLMyFrequencyTableViewCell : UITableViewCell
/**所有的MyFrequency模型数据**/
@property (nonatomic,copy)NSArray *allMyFrenquencyModels;
//+(instancetype)cellForTableView:(UITableView*)tableView;
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
