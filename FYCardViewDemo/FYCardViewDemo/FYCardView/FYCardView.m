//
//  FYCardView.m
//  特治司机端Real
//
//  Created by 冯宇的Mac mini on 2019/1/9.
//  Copyright © 2019 冯宇的Mac mini. All rights reserved.
//

#import "FYCardView.h"
#import <Foundation/Foundation.h>
@interface FYCardView()
{
    CGFloat margin;
}
@end

@implementation FYCardView
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title rightBtnTitle:(NSString *)rightTitle tag:(NSInteger)tag withOthers:(BOOL)isOtherView{
    self = [self initWithFrame:frame title:title withOthers:isOtherView];
    // 这里自定义卡片右上角视图
    UIButton *rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.sepretedLineW-50, 5, 60, 40)];
    [rightBtn addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:rightBtn];
    [rightBtn setTitle:rightTitle forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor colorWithRed:0 green:151.0/255 blue:231.0/255 alpha:1] forState:UIControlStateNormal];
    rightBtn.tag = tag;
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title withOthers:(BOOL)isOtherView{
    if (isOtherView) {
        self = [self initWithFrame:frame];
        /* 红色 */
        CALayer *redlayer = [[CALayer alloc]init];
        redlayer.frame = CGRectMake(15, 15, 5, 20);
        redlayer.backgroundColor = [UIColor redColor].CGColor;
        [self.layer addSublayer:redlayer];
        redlayer.cornerRadius = 2;
        
        /* title +10*/
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 15, 200, 20)];
        titleLabel.text = title;
        [self addSubview:titleLabel];
        
        /* 灰色分割线 */
        CALayer *sepretedlayer = [[CALayer alloc]init];
        sepretedlayer.frame = CGRectMake(10, 40, frame.size.width - 10 * 2, 1);
        sepretedlayer.backgroundColor = [UIColor colorWithRed:230/255.0f green:230/255.0f blue:230/255.0f alpha:1].CGColor;
        [self.layer addSublayer:sepretedlayer];

        self.sepretedLineY = CGRectGetMaxY(sepretedlayer.frame);
        self.sepretedLineX = CGRectGetMinX(sepretedlayer.frame);
        self.sepretedLineW = sepretedlayer.frame.size.width;
    } else {
        self = [self initWithFrame:frame];
    }
    return self;
}
//-(void)setSepretedLineW:(CGFloat)sepretedLineW{
//    // 设置线宽
//}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 如果大量这种 View 不建议这样
        /* 圆角阴影 */
        self.backgroundColor = [UIColor whiteColor];
        self.layer.shadowOpacity = 0.5; //阴影透明度
        self.layer.cornerRadius = 4;
        UIColor *grayColor = [UIColor grayColor];
        self.layer.shadowColor = grayColor.CGColor; //阴影的颜色
        self.layer.shadowRadius = 4; //阴影的圆角
        self.layer.shadowOffset = CGSizeMake(0, 2);//阴影偏移量
//        self.clipsToBounds = NO;
        margin = 15;

    }
    return self;
}
-(void)rightBtnClick:(UIButton *)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(rightBtnClickWithIndex:)]) {
        [self.delegate rightBtnClickWithIndex:sender.tag];
    }
}
@end
