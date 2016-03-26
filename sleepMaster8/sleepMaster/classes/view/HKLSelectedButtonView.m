//
//  HKLSelectedButtonView.m
//  sleepMaster
//
//  Created by 康隽 on 16/3/25.
//  Copyright © 2016年 康隽. All rights reserved.
//

#import "HKLSelectedButtonView.h"

@implementation HKLSelectedButtonView
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        self.label=[[UILabel alloc]init];
        
        [self addSubview:self.label];
    }
    return self;
}
-(void)layoutSubviews{
   self.label.frame=self.bounds;
}

@end
