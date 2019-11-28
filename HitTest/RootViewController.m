//
//  RootViewController.m
//  HitTest
//
//  Created by Avery An on 2019/11/28.
//  Copyright © 2019 Avery. All rights reserved.
//

#import "RootViewController.h"
#import "RedView.h"
#import "BrownView.h"
#import "YellowView.h"
#import "GreenView.h"
#import "UIView+HitTest.h"
#import "RedView+HitTest.h"

#define UIHeight    [[UIScreen mainScreen] bounds].size.height
#define UIWidth     [[UIScreen mainScreen] bounds].size.width


@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    {
        RedView *redView = [[RedView alloc] initWithFrame:CGRectMake(10, 100, UIWidth - 10*2, 300)];
        redView.backgroundColor = [UIColor redColor];
        [self.view addSubview:redView];

        BrownView *brownView = [[BrownView alloc] initWithFrame:CGRectMake(10, 140, redView.bounds.size.width - 10*2, 150)];
        brownView.backgroundColor = [UIColor brownColor];
        [redView addSubview:brownView];

        YellowView *yellowView = [[YellowView alloc] initWithFrame:CGRectMake(20, 20, brownView.bounds.size.width - 20*2, 60)];
        yellowView.backgroundColor = [UIColor yellowColor];
        [brownView addSubview:yellowView];

        GreenView *greenView = [[GreenView alloc] initWithFrame:CGRectMake(20, -100, yellowView.bounds.size.width - 20*2, 60)];
        greenView.backgroundColor = [UIColor greenColor];
        [yellowView addSubview:greenView];

        // 特殊处理:
        redView.needProcessSubviewHitTest = YES;
        brownView.needProcessSubviewHitTest = YES;
        yellowView.needProcessSubviewHitTest = YES;
    }
}

@end
