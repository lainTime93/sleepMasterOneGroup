//
//  HKLFrequencyView.h
//  sleepMaster
//
//  Created by 康隽 on 16/3/25.
//  Copyright © 2016年 康隽. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  每一个音频模型对应的小界面
 */
@interface HKLFrequencyView : UIView
/**音频名称**/
@property (nonatomic,copy)NSString *frequencyName;
/**默认音频图片名称**/
@property (nonatomic,copy)NSString *defaultImageName;
///**选中音频图片名称**/
//@property (nonatomic,copy)NSString *selectedImageName;
/**编号**/
@property (nonatomic,assign)NSInteger index;
/**音频名称Label**/
@property(nonatomic,strong)UILabel *nameLabel;
/**音频ImageView**/
@property(nonatomic,strong)UIButton *button;
@end
