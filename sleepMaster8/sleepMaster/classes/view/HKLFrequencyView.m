//
//  HKLFrequencyView.m
//  sleepMaster
//
//  Created by 康隽 on 16/3/25.
//  Copyright © 2016年 康隽. All rights reserved.
//

#import "HKLFrequencyView.h"
#import "Masonry.h"
@implementation HKLFrequencyView
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self createFrequencyNameLabel];
        [self createFrequencyButton];
        [self  layoutSubview];
    }
    return self;
}
#pragma mark -生成控件
-(void)createFrequencyNameLabel{
    self.nameLabel=[[UILabel alloc]init];
    self.nameLabel.font=[UIFont systemFontOfSize:10];
    self.nameLabel.textAlignment=NSTextAlignmentCenter;
    [self addSubview:self.nameLabel];
}
-(void)createFrequencyButton{
    self.button=[[UIButton alloc]init];
    self.button=[UIButton buttonWithType:UIButtonTypeCustom];
    self.button.alpha=0.5;
    self.button.selected=NO;
    [self addSubview:self.button];
}
#pragma mark -根据数据显示控件
-(void)setFrequencyName:(NSString *)frequencyName{
    _nameLabel.text=frequencyName;
}
-(void)setdefaultFrequencyImageName:(NSString *)defaultFrequencyImageName{
    UIImage *image=[UIImage imageNamed:defaultFrequencyImageName];
    [_button setImage:image forState:UIControlStateNormal];
}

#pragma mark -加载子视图约束
-(void)layoutSubview{
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.mas_width);
        make.height.mas_equalTo(self.mas_height).multipliedBy(0.1);
        make.bottom.mas_equalTo(self.mas_bottom);
        make.centerX.mas_equalTo(self.mas_centerX);
    }];
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.mas_width).multipliedBy(0.8);
        make.centerX.mas_equalTo(self.mas_centerX);
        make.bottom.mas_equalTo(self.nameLabel.mas_top).offset(-2);
        make.top.mas_equalTo(self.mas_top);
    }];
}








#pragma mark -button被点击时发出通知(没用上)
/**
 *  button被点中调用
 *
 *  @return <#return value description#>
 */
-(void)buttonClicked{
    self.button.selected=!self.button.selected;
    [self buttonSendNotatification];
}
// *  通知frequencyButton被点中
-(void)buttonSendNotatification{
    NSNotificationCenter *center=[NSNotificationCenter defaultCenter];
    [center postNotificationName:@"buttonSelected" object:self userInfo:@{
        @"state": self.button.selected? @"selected":@"normal",
        @"index": [NSNumber numberWithInteger:self.index]
        }];
}

@end
