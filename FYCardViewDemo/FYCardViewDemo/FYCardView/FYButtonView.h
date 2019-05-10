//
//  FYButtonView.h
//  特治司机端Real
//
//  Created by 冯宇的Mac mini on 2019/2/19.
//  Copyright © 2019 冯宇的Mac mini. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol FYButtonViewDelegate <NSObject>

-(void)fyButtonViewClick:(NSInteger)index;

@end

@interface FYButtonView : UIView

@property (nonatomic, copy) NSString *btnValue;
@property (nonatomic, copy) NSString *btnName;

@property (nonatomic, weak)id<FYButtonViewDelegate>fyButtonViewDelegate;

/**
 创建上面是值，下面是这个值代表的意思的 btn，常用来查看今日流水等 View

 @param btnName btn 的名字
 @param value 值
 @param index  标识这个 FYButtonView
 @param frame 响应区域
 @return 可点击 View
 */
-(instancetype)initFYButtonViewWithBtnName:(NSString *)btnName value:(NSString *)value index:(NSInteger)index Frame:(CGRect)frame;

@end

NS_ASSUME_NONNULL_END
