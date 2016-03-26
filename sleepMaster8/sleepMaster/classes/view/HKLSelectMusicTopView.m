//
//  HKLSelectMusicHeaderView.m
//  sleepMaster
//
//  Created by 康隽 on 16/3/25.
//  Copyright © 2016年 康隽. All rights reserved.
//

#import "HKLSelectMusicTopView.h"
#import "Masonry.h"
@interface HKLSelectMusicTopView()

@end

@implementation HKLSelectMusicTopView
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        self.button=[UIButton buttonWithType:UIButtonTypeSystem];
        self.button.backgroundColor=[UIColor colorWithRed:34.0/255 green:130.0/255 blue:240.0/255 alpha:1];
        self.button.tintColor=[UIColor blackColor];
    [self.button setTitle:@"随机生成" forState:UIControlStateNormal];
    [self addSubview:self.button];
        [self layoutSubview];
    }
    return self;
}
-(void)layoutSubview{
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.mas_width);
        make.height.mas_equalTo(self.mas_height);
        make.centerX.mas_equalTo(self.mas_centerX);
        make.centerY.mas_equalTo(self.mas_centerY);
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
