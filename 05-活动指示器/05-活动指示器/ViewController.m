//
//  ViewController.m
//  05-活动指示器
//
//  Created by xiaomage on 15/6/24.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CAReplicatorLayer *repL = [CAReplicatorLayer layer];
    
    repL.frame = CGRectMake(0.5*([UIScreen mainScreen].bounds.size.width-50), 0.5*([UIScreen mainScreen].bounds.size.height - 50), 50, 50);
    repL.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:repL];
    
    
    CALayer *layer = [CALayer layer];
    
    layer.transform = CATransform3DMakeScale(0, 0, 0);
    layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"雪花"].CGImage);
    layer.position = CGPointMake(100, 20);
    
    layer.bounds = CGRectMake(0, 0, 10, 10);
    
    layer.backgroundColor = [UIColor greenColor].CGColor;
    
    
    [repL addSublayer:layer];
    
    // 设置缩放动画
    CABasicAnimation *anim = [CABasicAnimation animation];
    
    anim.keyPath = @"transform.scale";
    
    anim.fromValue = @1;
    
    anim.toValue = @0;
    
    anim.repeatCount = MAXFLOAT;
    
    CGFloat duration = 1;
    
    anim.duration = duration;
    
    [layer addAnimation:anim forKey:nil];
    
    
    int count = 20;
    
    CGFloat angle = M_PI * 2 / count;
    
    // 设置子层总数
    repL.instanceCount = count;
    
    repL.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1);
    
    repL.instanceDelay = duration / count;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
