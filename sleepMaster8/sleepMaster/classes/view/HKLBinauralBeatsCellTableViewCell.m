//
//  HKLBinauralBeatsCellTableViewCell.m
//  sleepMaster
//
//  Created by 康隽 on 16/3/25.
//  Copyright © 2016年 康隽. All rights reserved.
//

#import "HKLBinauralBeatsCellTableViewCell.h"
#import "HKLFrequencyView.h"
#import "HKLDoubleBinauralBeatsMusicModel.h"
#import "Masonry.h"
#define HEIGHT 50
#define WIDTH 50
#define HSPACE 50
#define VSPACE 25

@implementation HKLBinauralBeatsCellTableViewCell
-(instancetype)initWithData:(NSMutableArray *)allModelData{
    self=[super init];
    if(self){
        self.allFrequencyViews=[NSMutableArray array];
        self.allDoubleBinauralBeatsModels=allModelData;
        [self creatCompactViews];
        [self layoutSubview];
    }
    return self;
}

#pragma mark -根据数据模型生成对应数目的FrequencyView
-(void)creatCompactViews{
    for (int i=0; i<self.allDoubleBinauralBeatsModels.count; i++) {
        HKLDoubleBinauralBeatsMusicModel *model=self.allDoubleBinauralBeatsModels[i];
        HKLFrequencyView *frequencyView=[[HKLFrequencyView alloc]init];
        frequencyView.index=i;
        frequencyView.frequencyName=model.frequencyName;
       UIImage *image= [UIImage imageNamed:model.defaultIconName];
        [frequencyView.button setBackgroundImage:image forState:UIControlStateNormal];
//      [frequencyView.button setImage:image forState:UIControlStateNormal];
    
//        frequencyView.defaultImageName=model.defaultIconName;
        //frequencyView.selectedImageName=model.selectIconName;
        [self addSubview:frequencyView];
        [self.allFrequencyViews addObject:frequencyView];
    }
}
#pragma mark -加载子视图约束
-(void)layoutSubview{
    for (int i=0; i<self.allFrequencyViews.count; i++) {
        HKLFrequencyView *frequencyView=self.allFrequencyViews[i];
        [frequencyView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(50);
            make.height.mas_equalTo(50);
            make.centerX.mas_equalTo(self.mas_left).offset((i%4)*(WIDTH+HSPACE)+HSPACE);
            make.centerY.mas_equalTo(self.mas_top).offset((i/4)*(HEIGHT+VSPACE)+VSPACE+5);
        }];
    }
}

@end
