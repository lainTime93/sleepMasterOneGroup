//
//  HKLSelectMusicViewController.m
//  sleepMaster
//
//  Created by 康隽 on 16/3/25.
//  Copyright © 2016年 康隽. All rights reserved.
//

#import "HKLSelectMusicViewController.h"
#import "HKLBinauralBeatsCellTableViewCell.h"
#import "HKLMyFrequencyTableViewCell.h"
#import "HKLDefaultFrequencyTableViewCell.h"
#import "HKLSelectMusicBottomView.h"
#import "HKLSelectMusicTopView.h"
#import "HKLSelectedButtonView.h"
#import "HKLDataManager.h"
#import "Masonry.h"
#import "HKLFrequencyView.h"
@interface HKLSelectMusicViewController ()<UITableViewDataSource,UITableViewDelegate>
#pragma mark 视图属性
/**顶部视图**/
@property(nonatomic,strong)HKLSelectMusicTopView *topView;
/**表格视图**/
@property(nonatomic,strong)UITableView *tableView;
/**选中音乐图标时弹出来2秒钟的提示界面**/
@property(nonatomic,strong)HKLSelectedButtonView *selectedButtonView;
/**底部视图**/
@property(nonatomic,strong)HKLSelectMusicBottomView *bottomView;

#pragma mark 模型属性
/**第一个cell的数据模型**/
@property(nonatomic,strong)NSMutableArray *allDoubleBinauralBeatsMusicModel;
/**第二个cell的数据模型**/
@property(nonatomic,strong)NSMutableArray *allMyMusicModel;
/**第三个cell的数据模型**/
@property(nonatomic,strong)NSMutableArray *allDefaultFrequencyModel;
#pragma mark 底部约束
/**底部约束，用于底部视图从父视图有按钮被点击时弹出来**/
@property (nonatomic,assign)NSInteger bottomLayoutConstraint;
#pragma mark 点击button有关属性
/**所有的button**/
@property(nonatomic,strong)NSMutableArray *allButtons;
/**超过5次提示label**/
@property(nonatomic,strong)UILabel *OverTimelabel;
/**所有选中的button**/
@property(nonatomic,strong)NSMutableArray *allSelectedButton;
/**记录是第几个点击的button**/
@property(nonatomic,assign)NSInteger selectedButtonCount;
@end

@implementation HKLSelectMusicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatAllSubViews];
    [self layoutSubview];
    self.selectedButtonCount=0;
    self.bottomLayoutConstraint=-1*self.view.bounds.size.height*0.15;
    [self.tableView registerClass:[HKLBinauralBeatsCellTableViewCell class] forCellReuseIdentifier:@"cell1"];
    [self.tableView registerClass:[HKLMyFrequencyTableViewCell class] forCellReuseIdentifier:@"cell2"];
    [self.tableView registerClass:[HKLDefaultFrequencyTableViewCell class] forCellReuseIdentifier:@"cell3"];
}
#pragma mark -在view讲显示时配置subView

#pragma mark -配置控制器的所有界面
-(void)creatAllSubViews{
    [self createNavi];
    [self createTopView];
    [self creatTableView];
    [self creatSelectedButtonView];
    [self creatBottomView];
    [self creatOverTimeLabel];
}
-(void)createNavi{
    self.title=@"自定义混音";
    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(goToMusicListVC)];
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithTitle:@"详情" style:UIBarButtonItemStylePlain target:self action:@selector(goToMusicDetalInfoVC)];
    self.navigationItem.leftBarButtonItem=leftItem;
    self.navigationItem.rightBarButtonItem=rightItem;
}
-(void)createTopView{
    self.topView=[[HKLSelectMusicTopView alloc]init];
//    self.topView.backgroundColor=[UIColor clearColor];
    [self.view addSubview:self.topView];
}
-(void)creatTableView{
    self.tableView=[[UITableView alloc]init];
//    self.tableView.backgroundColor=[UIColor clearColor];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    [self.view addSubview:self.tableView];

}
-(void)creatSelectedButtonView{
    self.selectedButtonView=[[HKLSelectedButtonView alloc]init];
//    self.selectedButtonView.backgroundColor=[UIColor clearColor];
    self.selectedButtonView.hidden=YES;
    [self.view addSubview:self.selectedButtonView];
}
-(void)creatBottomView{
    self.bottomView=[[HKLSelectMusicBottomView alloc]init];
    self.bottomView.backgroundColor=[UIColor whiteColor];
//    self.bottomView.hidden=YES;
    [self.view addSubview:self.bottomView];

}
-(void)creatOverTimeLabel{
    self.OverTimelabel=[[UILabel alloc]init];
    self.OverTimelabel.hidden=YES;
    self.OverTimelabel.text=@"不能超过6个,且其中必须包括且一个双声拍";
    self.OverTimelabel.textColor=[UIColor redColor];
    self.OverTimelabel.font=[UIFont systemFontOfSize:12];
    self.OverTimelabel.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:self.OverTimelabel];
}
#pragma mark 加载约束
/**
 *  自己调用的，不是系统的
 */
-(void)layoutSubview{
    [self layoutTopView];
    [self layoutTableView];
    [self layoutSelectButtonView];
    [self layoutBottomView];
    [self layoutOverTimeLabel];
}
-(void)layoutTopView{
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.view.mas_width);
        make.height.mas_equalTo(self.view.mas_height).multipliedBy(0.1);
        make.top.mas_equalTo(self.view.mas_top).offset(64);
        make.centerX.mas_equalTo(self.view.mas_centerX);
    }];
}
-(void)layoutTableView{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.view.mas_width);
        make.top.mas_equalTo(self.topView.mas_bottom);
//        make.bottom.mas_equalTo(self.view.mas_bottom);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(self.bottomLayoutConstraint);
    }];
}
-(void)layoutSelectButtonView{
    [self.selectedButtonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(self.view.mas_width).multipliedBy(0.7);
        make.height.mas_equalTo(self.view.mas_height).multipliedBy(0.15);
        make.bottom.mas_equalTo(self.view.mas_bottom).multipliedBy(0.7);
    }];
}
-(void)layoutBottomView{
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(self.view.mas_width);
        make.top.mas_equalTo(self.tableView.mas_bottom);
//        make.bottom.mas_equalTo(self.view.mas_bottom);
        make.height.mas_equalTo(self.view.mas_height).multipliedBy(0.2);
    }];

}
-(void)layoutOverTimeLabel{
   [self.OverTimelabel mas_makeConstraints:^(MASConstraintMaker *make) {
       make.centerX.mas_equalTo(self.view.mas_centerX);
       make.centerY.mas_equalTo(self.view.mas_centerY);
       make.width.mas_equalTo(self.view.mas_width).multipliedBy(0.6);
       make.height.mas_equalTo(self.view.mas_height).multipliedBy(0.1);
   }];
}
#pragma mark -属性懒加载
-(NSMutableArray *)allDoubleBinauralBeatsMusicModel{
    if (_allDoubleBinauralBeatsMusicModel==nil) {
        _allDoubleBinauralBeatsMusicModel=[[HKLDataManager creatDoubleBinauralBeatsMousicModel] mutableCopy];
    }
    return _allDoubleBinauralBeatsMusicModel;
}
-(NSMutableArray*)allMyMusicModel{
    if (_allMyMusicModel==nil) {
        _allMyMusicModel=[[HKLDataManager creatMyMusicFrequencyModel] mutableCopy];
    }
    return _allMyMusicModel;
}

-(NSMutableArray*)allDefaultFrequencyModel{
    if (_allDefaultFrequencyModel==nil) {
        _allDefaultFrequencyModel=[[HKLDataManager creatDefaultFrequencyModel] mutableCopy];
    }
    return _allDefaultFrequencyModel;
}
//-(NSInteger)bottomLayoutConstraint{
//    return _bottomView.bounds.size.height*(-1);
//}
-(NSMutableArray *)allButtons{
    if (_allButtons==nil) {
        _allButtons=[NSMutableArray array];
    }
    return _allButtons;
}
-(NSMutableArray*)allSelectedButton{
    if (_allSelectedButton==nil) {
        _allSelectedButton=[NSMutableArray array];
    }
    return _allSelectedButton;
}
#pragma mark -UITableViewDataSource,UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"%ld",indexPath.section);
    switch (indexPath.section) {
        case 0:
            return [self creatCellone:indexPath];
        case 1:
            return [self creatCelltwo:indexPath];
        case 2:
            return [self creatCellthree:indexPath];
    }
    return 0;
}
#pragma mark -设置不同的cell
-(UITableViewCell*)creatCellone:(NSIndexPath*)indexPath{
 
    HKLBinauralBeatsCellTableViewCell  *cell=[[HKLBinauralBeatsCellTableViewCell alloc]initWithData:self.allDoubleBinauralBeatsMusicModel];
    [self cellOneAddTargets:cell];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}
-(UITableViewCell*)creatCelltwo:(NSIndexPath*)indexPath{

 
     HKLMyFrequencyTableViewCell *cell=[[HKLMyFrequencyTableViewCell alloc]initWithData:self.allMyMusicModel];
    [self cellTowAddTargets:cell];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;

   
    return cell;
}
-(UITableViewCell*)creatCellthree:(NSIndexPath*)indexPath{
   
    HKLDefaultFrequencyTableViewCell*  cell=[[HKLDefaultFrequencyTableViewCell alloc]initWithData:self.allDefaultFrequencyModel];
    [self cellThreeAddTargets:cell];
   cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}
#pragma mark -跳转界面
-(void)goToMusicListVC{}
-(void)goToMusicDetalInfoVC{}

#pragma mark -CELL的行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            return (CGFloat)self.allDoubleBinauralBeatsMusicModel.count/4*50+50;
        case 1:
            return (CGFloat)self.allMyMusicModel.count/4*50+50;
        case 2:
            return (CGFloat)self.allDefaultFrequencyModel.count/4*(50+25)+50;
    }
    return 0;
}

#pragma mark -为cell中的button添加点击事件
-(void)cellOneAddTargets:(HKLBinauralBeatsCellTableViewCell*)sender{
    for (int i=0; i<self.allDoubleBinauralBeatsMusicModel.count; i++) {
        UIButton *button=((HKLFrequencyView*)sender.allFrequencyViews[i]).button;
        button.tag=i;
        [button addTarget:self action:@selector(cellButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.allButtons addObject:button];
    }
}
-(void)cellTowAddTargets:(HKLMyFrequencyTableViewCell*)sender{
    for (int i=0; i<sender.allMyFrenquencyModels.count; i++) {
        UIButton *button=((HKLFrequencyView*)sender.allFrequencyViews[i]).button;
        button.tag=i+100;
        [button addTarget:self action:@selector(cellButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.allButtons addObject:button];
    }
}
-(void)cellThreeAddTargets:(HKLDefaultFrequencyTableViewCell*)sender{
    for (int i=0; i<self.allDefaultFrequencyModel.count; i++) {
        UIButton *button=((HKLFrequencyView*)sender.allFrequencyViews[i]).button;
        button.tag=i+200;
        [button addTarget:self action:@selector(cellButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.allButtons addObject:button];
    }
}
#pragma mark -cell中button的点击事件
-(void)cellButtonClick:(UIButton*)sender{
    //sender.tag 0~100 双声 100~200 我的音频 200+默认模型
    //记录双音个数
    static int _doubleFrequencyCount=0;
    //如果button几经被点过，取消选中，如果是双音，还要减1
    for (UIButton *button in self.allSelectedButton) {
        if (button.tag==sender.tag) {
            sender.selected=NO;
            [self.allSelectedButton removeObject:sender];
            sender.alpha=0.5;
//            _selectedButtonCount--;
            if (sender.tag<100) {
                _doubleFrequencyCount--;
            }
            return;
        }
    }
    //如果是双声音，记录加一
    if (sender.tag<100) {
        _doubleFrequencyCount++;
    }
    if (self.allSelectedButton.count==6) {
        [self showSuggestLabel];
        return;
    }
    //如果个数超过6个，或者有两个双音，提示，跳出此方法
    if (_doubleFrequencyCount>=2) {
        for (UIButton *button in self.allSelectedButton) {
            if (button.tag<100) {
                button.selected=NO;
                button.alpha=0.5;
                _doubleFrequencyCount--;
//              self.selectedButtonCount--;
                [self.allSelectedButton removeObject:button];
            }
        }
    }

//    _selectedButtonCount++;
    sender.selected=YES;
    sender.alpha=1;
    [self.allSelectedButton addObject:sender];
    //如果超过1个按钮是选中状态，弹出下方的控制界面
    if (_selectedButtonCount!=0) {
        self.bottomLayoutConstraint=0;
    }else{
        self.bottomLayoutConstraint=-self.view.bounds.size.height*0.15;
    }
    [UIView animateKeyframesWithDuration:1 delay:0 options:7 animations:^{
        [self.view layoutIfNeeded];
    } completion:nil];
}

#pragma mark -显示提示label
-(void)showSuggestLabel{
    self.OverTimelabel.hidden=NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            self.OverTimelabel.hidden=YES;
        });
    });
};
#pragma mark -每个section标题
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return @"双声拍（必选）";
        case 1:
            return @"我的音频";
        default:
           return @"默认音频";
    }

}
@end
