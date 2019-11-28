//
//  RedView+HitTest.m
//  TestProject
//
//  Created by Avery An on 2019/7/17.
//  Copyright © 2019 Avery An. All rights reserved.
//

#import "RedView+HitTest.h"

@implementation RedView (HitTest)

#pragma mark - Override Methods -
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (!self.isUserInteractionEnabled || self.isHidden || self.alpha <= 0.01) {
        return [super hitTest:point withEvent:event];
    }
    else if (self.needProcessSubviewHitTest == NO && FORCED_ProcessSubviewHitTest == NO) {
        UIView *tapedView = [self default_hitTest:point withEvent:event];
        if (tapedView) {
            return tapedView;
        }
    }
    else if ([self pointInside:point withEvent:event]) { //当前View可响应当前的点击事件
        for (UIView *subView in [self.subviews reverseObjectEnumerator]) {
            if (!subView.isUserInteractionEnabled || subView.isHidden || subView.alpha <= 0.01) {
                continue;
            }
            else if (subView.needProcessSubviewHitTest == NO && FORCED_ProcessSubviewHitTest == NO) {
                CGPoint convertedPoint = [subView convertPoint:point fromView:self];
                UIView *hitTestView = [subView default_hitTest:convertedPoint withEvent:event];
                if (hitTestView) {
                    return hitTestView;
                }
            }
            else {
                CGPoint convertedPoint = [subView convertPoint:point fromView:self];
                UIView *hitTestView = [self getContainviewsInSubview:subView
                                                           withPoint:convertedPoint
                                                               event:event];
                if (hitTestView) {
                    return hitTestView;
                }
            }
        }

        return self;
    }

    return [super hitTest:point withEvent:event];
}

@end
