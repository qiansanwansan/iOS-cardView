//
//  ViewController.m
//  FYCardViewDemo
//
//  Created by 冯宇的Mac mini on 2019/5/9.
//  Copyright © 2019 冯宇的Mac mini. All rights reserved.
//
#define Kwidth [[UIScreen mainScreen] bounds].size.width
#import "ViewController.h"
#import "FYCardView.h"
#import "FYButtonView.h"
#import "FYCardView.h"
#import "UIView+FYView.h"
@interface ViewController ()<FYButtonViewDelegate,rightBtnClickDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 今日统计
    FYCardView *view1 = [[FYCardView alloc] initWithFrame:CGRectMake(10, 80, Kwidth - 20, 130) title:@"今日统计" withOthers:YES] ; //
    [self.view addSubview:view1];
    NSArray *titleArr = @[@"今日开单",@"今日流水"];
    for (NSInteger i = 0; i<2; i++) {
        FYButtonView *kaidanBtn = [[FYButtonView alloc]initFYButtonViewWithBtnName:titleArr[i] value:@"0" index:i Frame:CGRectMake(view1.sepretedLineX+(view1.sepretedLineW/2)*i, view1.sepretedLineY, view1.sepretedLineW/2, view1.height - view1.sepretedLineY)];
        kaidanBtn.fyButtonViewDelegate = self;
        [view1 addSubview:kaidanBtn];
    }
    
    // 财务统计
    FYCardView *view2 = [[FYCardView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(view1.frame)+10, Kwidth - 20, 130) title:@"财务统计" withOthers:NO] ;
    [self.view addSubview:view2];
    NSArray *titleArr1 = @[@"总结单量",@"总收入"];//TZandroid5788
    for (NSInteger i = 2; i<4; i++) {
        FYButtonView *kaidanBtn = [[FYButtonView alloc]initFYButtonViewWithBtnName:titleArr1[i-2] value:@"0" index:i Frame:CGRectMake(view2.sepretedLineX+(view2.sepretedLineW/2)*(i-2), view2.sepretedLineY, view2.sepretedLineW/2, view2.height - view2.sepretedLineY)];
        kaidanBtn.fyButtonViewDelegate = self;
        [view2 addSubview:kaidanBtn];
    }
    
    // 管理
    FYCardView *view3 = [[FYCardView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(view2.frame)+10, Kwidth - 20, 100) title:@"媳妇儿说我是她的信球货" withOthers:YES] ;
    [self.view addSubview:view3];
//    NSArray *titleArr2 = @[@"车辆管理",@"网点管理",@"行程管理",@"违章事故",@"计费规则",@"我的钱包"];
//    for (NSInteger i = 0; i<6; i++) {
//        NSInteger ver = i/3; // 第几行
//        NSInteger hor = i%3; // 第几列
//
//    }
    FYCardView *view4 = [[FYCardView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(view3.frame)+10, Kwidth - 20, 150) title:@"管理" rightBtnTitle:@"编辑" tag: 100 withOthers:YES];
    view4.delegate = self;
    [self.view addSubview:view4];
    
    // 模拟刷新数据
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        FYButtonView *kaidanBtn = [self.view viewWithTag:1];
        kaidanBtn.btnValue = @"1001";
    });
    
}
-(void)fyButtonViewClick:(NSInteger)index
{
    NSLog(@"%ld",index);
}
-(void)rightBtnClickWithIndex:(NSInteger)index{
    if (index == 100) {
        NSLog(@"%s",__func__);
    }
}

@end
