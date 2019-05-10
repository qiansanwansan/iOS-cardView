//
//  FYButtonView.m
//  特治司机端Real
//
//  Created by 冯宇的Mac mini on 2019/2/19.
//  Copyright © 2019 冯宇的Mac mini. All rights reserved.
//

#import "FYButtonView.h"

@interface FYButtonView ()


@property (nonatomic, assign) NSInteger index;

@property(nonatomic, strong) UILabel *btnNameLabel; // 
@property(nonatomic, strong) UILabel *btnValueLabel;
@end

@implementation FYButtonView

-(instancetype)initFYButtonViewWithBtnName:(NSString *)btnName value:(NSString *)value index:(NSInteger)index Frame:(CGRect)frame
{
    self.btnValue = value;
    self.btnName = btnName;
    self.index = index;
    return [self initWithFrame:frame];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.tag = self.index;
        // 上面是 value，下面是 btn 的名称 注意 frame 的高度
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, (frame.size.height-50)/2, frame.size.width, 25)];
        label.text = _btnValue;
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor darkTextColor];
        label.font = [UIFont systemFontOfSize:20];
        _btnValueLabel = label;
        
        UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(label.frame), frame.size.width, 25)];
        label1.text = _btnName;
        label1.textAlignment = NSTextAlignmentCenter;
        label1.textColor = [UIColor darkGrayColor];
        label1.font = [UIFont systemFontOfSize:17];
        _btnNameLabel = label1;

        [self addSubview:label];
        [self addSubview:label1];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
        [self addGestureRecognizer:tap];
    }
    return self;
}
// 获取到网络数据后在这里刷新数据
-(void)setBtnValue:(NSString *)btnValue{
    _btnValue = btnValue;
    _btnValueLabel.text = btnValue;
}
-(void)tap{
    if (self.fyButtonViewDelegate && [self.fyButtonViewDelegate respondsToSelector:@selector(fyButtonViewClick:)]) {
        [self.fyButtonViewDelegate fyButtonViewClick:_index];
    }
}


@end
