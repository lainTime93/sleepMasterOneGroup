//
//  HKLSelectMusicButtonView.h
//  sleepMaster
//
//  Created by 康隽 on 16/3/25.
//  Copyright © 2016年 康隽. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  音乐选择界面底部的调节界面 底部视图
 */
@interface HKLSelectMusicBottomView : UIView
/**button的数据模型**/
@property (nonatomic,strong)NSArray *customMusicModel;
/**所有的button**/
@property (nonatomic,strong)NSMutableArray *allButtons;
/**保存按钮**/
@property(nonatomic,strong)UIButton *saveButton;
@property(nonatomic,strong)UIImageView *leftImageView;
@property(nonatomic,strong)UIImageView *rightImageView;
@property(nonatomic,strong)UISlider *slider;
@end
