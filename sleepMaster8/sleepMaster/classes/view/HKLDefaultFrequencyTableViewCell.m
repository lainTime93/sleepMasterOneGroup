//
//  HKLDefaultFrequencyTableViewCell.m
//  sleepMaster
//
//  Created by 康隽 on 16/3/25.
//  Copyright © 2016年 康隽. All rights reserved.
//

#import "HKLDefaultFrequencyTableViewCell.h"
#import "HKLDefaultFrequencyModel.h"
#import "Masonry.h"
#import "HKLFrequencyView.h"
#define HEIGHT 50
#define WIDTH 50
#define HSPACE 50
#define VSPACE 25
@interface HKLDefaultFrequencyTableViewCell()

@end
@implementation HKLDefaultFrequencyTableViewCell

-(instancetype)initWithData:(NSMutableArray *)allModelData{
    self=[super init];
    if(self){
        self.allFrequencyViews=[NSMutableArray array];
        self.allDefaultFrequencyModels=allModelData;
        [self creatCompactViews];
        [self layoutSubview];
    }
    return self;
}

#pragma mark -根据数据模型生成对应数目的FrequencyView
-(void)creatCompactViews{
    for (int i=0; i<self.allDefaultFrequencyModels.count; i++) {
        HKLDefaultFrequencyModel *model=self.allDefaultFrequencyModels[i];
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

























//-(instancetype)initWithFrame:(CGRect)frame{
//    self=[super initWithFrame:frame];
//    if (self) {
//        NSMutableArray *array=[NSMutableArray array];
//        for (int i=0; i<self.allDefaultFrequencyModels.count; i++) {
//            HKLDefaultFrequencyModel *model=self.allFrequencyViews[i];
//            HKLFrequencyView *frequencyView=[[HKLFrequencyView alloc]init];
//            frequencyView.index=i;
//            frequencyView.frequencyName=model.frequencyName;
//            frequencyView.defaultImageName=model.defaultIconName;
////            frequencyView.selectedImageName=model.selectIconName;
//            [self addSubview:frequencyView];
//            [frequencyView mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.width.mas_equalTo(50);
//                make.height.mas_equalTo(50);
//                make.centerX.mas_equalTo((i%4)*WIDTH+HSPACE);
//                make.centerY.mas_equalTo((i/4)*HEIGHT+VSPACE);
//            }];
//            [array addObject:frequencyView];
//        }
//        self.allFrequencyViews=array;
//    }
//    return self;
//}
//- (void)awakeFromNib {
//    // Initialization code
//}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

@end
