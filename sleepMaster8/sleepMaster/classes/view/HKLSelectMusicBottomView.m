//
//  HKLSelectMusicButtonView.m
//  sleepMaster
//
//  Created by 康隽 on 16/3/25.
//  Copyright © 2016年 康隽. All rights reserved.
//

#import "HKLSelectMusicBottomView.h"
#import "Masonry.h"
@implementation HKLSelectMusicBottomView
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self createButtons];
        [self createSlider];
        [self createImageViews];
        [self layoutSubview];
           }
    return self;
}

#pragma mark -生成button
-(void)createButtons{
    for (int i=0; i<7; i++) {
        UIButton *button=[[UIButton alloc]init];
        [self addSubview:button];
        [self.allButtons addObject:button];
    }
}
#pragma mark 生成左右imageview
-(void)createImageViews{
    self.leftImageView=[[UIImageView alloc]init];
    self.leftImageView.image=[UIImage imageNamed:@"volume2"];
    [self addSubview:self.leftImageView];
    self.rightImageView=[[UIImageView alloc]init];
    self.rightImageView.image=[UIImage imageNamed:@"volume1"];
      [self addSubview:self.rightImageView];
}
#pragma mark -生成slider
-(void)createSlider{
    self.slider=[[UISlider alloc]init];
    self.slider.backgroundColor=[UIColor whiteColor];
    [self addSubview:self.slider];

}

#pragma mark -给子视图加约束
-(void)layoutSubview{
    [self layoutButtons];
    [self layoutImageViews];
    [self layoutSlider];
}

-(void)layoutButtons{
    for (int i=0; i<self.allButtons.count; i++) {
    UIButton *button=self.allButtons[i];
        [self addSubview:button];
    if (i==6) {
        button.hidden=NO;
        button.enabled=NO;
        [button setTitle:@"保存" forState:UIControlStateNormal];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(self.mas_height).multipliedBy(0.4);
            make.width.mas_equalTo(self.mas_width).multipliedBy(0.2);
            make.bottom.mas_equalTo(self.mas_bottom).offset(-5);
            make.left.mas_equalTo(self.mas_left).offset((button.bounds.size.width)*i+5);
        }];
    }else{
        button.hidden=YES;
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(self.mas_width).multipliedBy(0.1);
            make.height.mas_equalTo(self.mas_height).multipliedBy(0.4);
            make.bottom.mas_equalTo(self.mas_bottom).offset(-5);
            make.left.mas_equalTo(self.mas_left).offset((button.bounds.size.width)*i+5);
        }];
    }}
}
-(void)layoutImageViews{
    [self.leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(30);
        make.top.mas_equalTo(self.mas_top).offset(20);
    }];
    [self.rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).offset(-5);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(30);
        make.top.mas_equalTo(self.mas_top).offset(20);
    }];
}
-(void)layoutSlider{
    [self.slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(self.mas_height).multipliedBy(0.4);
        make.left.mas_equalTo(self.leftImageView.mas_right);
        make.right.mas_equalTo(self.rightImageView.mas_left);
//        make.bottom.mas_equalTo(self.mas_bottom).offset(5);
        make.top.mas_equalTo(self.mas_top).offset(5);
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
