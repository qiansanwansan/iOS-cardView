//
//  FYCardView.h
//  特治司机端Real
//
//  Created by 冯宇的Mac mini on 2019/1/9.
//  Copyright © 2019 冯宇的Mac mini. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol rightBtnClickDelegate <NSObject>

@optional

-(void)rightBtnClickWithIndex:(NSInteger)index;

@end


@interface FYCardView : UIView
// 这里只使用了读取数据
@property (nonatomic, assign) CGFloat sepretedLineX;
@property (nonatomic, assign) CGFloat sepretedLineY;
@property (nonatomic, assign) CGFloat sepretedLineW;

/**
 建立常用卡片 View，右边也有按钮或者其它视图

 @param frame frame
 @param title 卡片标题（左上角位置，如：今日开单）
 @param rightTitle 卡片右上角视图文字
 @param tag 在此例中标识右上角 view ，也可扩展为卡片的 tag，配合 FYButtonView 使用
 @param isOtherView 是否建立空白卡片，YES：建立
 @return 卡片 View
 */
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title rightBtnTitle:(NSString *)rightTitle tag:(NSInteger)tag withOthers:(BOOL)isOtherView;

/**
 建立常用卡片 View

 @param frame frame
 @param title 卡片标题（左上角位置，如：今日开单）
 @param isOtherView 是否建立空白卡片，YES：建立
 @return 卡片 View
 */
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title withOthers:(BOOL)isOtherView;

@property (nonatomic, weak) id<rightBtnClickDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
