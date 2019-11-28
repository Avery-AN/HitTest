//
//  UIView+HitTestPublicMethods.h
//  TestProject
//
//  Created by Avery An on 2019/7/17.
//  Copyright © 2019 Avery An. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

/*
 FORCED_ProcessSubviewHitTest的值为YES时:
 会强制轮询所有子视图、并在这些子视图中寻找可响应点击事件的view、
 此时view的needProcessSubviewHitTest属性值失效；
 */
static BOOL FORCED_ProcessSubviewHitTest = NO;


NS_ASSUME_NONNULL_BEGIN

@interface UIView (HitTestPublicMethods)

@property (nonatomic, assign) BOOL needProcessSubviewHitTest;
@property (nonatomic, assign) NSInteger depth;

- (UIView *)default_hitTest:(CGPoint)point withEvent:(UIEvent *)event;

/**
 从子视图中获取所点击到的View
 
 @param subView 子视图
 @param point 点击处的位置
 @param event event事件
 */
- (id)getContainviewsInSubview:(UIView *)subView
                     withPoint:(CGPoint)point
                         event:(UIEvent *)event;

@end

NS_ASSUME_NONNULL_END
