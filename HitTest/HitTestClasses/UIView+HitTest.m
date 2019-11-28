//
//  UIView+HitTest.m
//  TestProject
//
//  Created by Avery An on 2019/7/10.
//  Copyright © 2019 Avery An. All rights reserved.
//

#import "UIView+HitTest.h"

@implementation UIView (HitTest)

#pragma mark - Override Methods -
//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    if (!self.isUserInteractionEnabled || self.isHidden || self.alpha <= 0.01) {
//        return nil;
//    }
//    else if ([self isMemberOfClass:[UIWindow class]] ||
//             [self isMemberOfClass:[NSClassFromString(@"UILayoutContainerView") class]] ||
//             [self isMemberOfClass:[NSClassFromString(@"UINavigationTransitionView") class]] ||
//             [self isMemberOfClass:[NSClassFromString(@"UIViewControllerWrapperView") class]] ||
//             [self isMemberOfClass:[NSClassFromString(@"UIStatusBarWindow") class]] ||
//             [self isMemberOfClass:[NSClassFromString(@"UIStatusBar_Modern") class]]) {
//        UIView *hitTestView = [self default_hitTest:point withEvent:event];
//        if (hitTestView) {
//            return hitTestView;
//        }
//    }
//    else if (self.needProcessSubviewHitTest == NO && FORCED_ProcessSubviewHitTest == NO) {
//        UIView *hitTestView = [self default_hitTest:point withEvent:event];
//        if (hitTestView) {
//            return hitTestView;
//        }
//    }
//    else if ([self pointInside:point withEvent:event]) {
//        for (UIView *subView in [self.subviews reverseObjectEnumerator]) {
//            if (!subView.isUserInteractionEnabled || subView.isHidden || subView.alpha <= 0.01) {
//                continue;
//            }
//            else if (subView.needProcessSubviewHitTest == NO && FORCED_ProcessSubviewHitTest == NO) {
//                CGPoint convertedPoint = [subView convertPoint:point fromView:self];
//                UIView *hitTestView = [subView default_hitTest:convertedPoint withEvent:event];
//                if (hitTestView) {
//                    return hitTestView;
//                }
//            }
//            else {
//                CGPoint convertedPoint = [subView convertPoint:point fromView:self];
//                UIView *hitTestView = [self getContainviewsInSubview:subView
//                                                           withPoint:convertedPoint
//                                                               event:event];
//                if (hitTestView) {
//                    return hitTestView;
//                }
//            }
//        }
//
//        return self;
//    }
//
//    return nil;
//}

@end

