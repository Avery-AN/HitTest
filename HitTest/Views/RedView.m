//
//  RedView.m
//  TestProject
//
//  Created by Avery An on 2019/7/10.
//  Copyright © 2019 Avery An. All rights reserved.
//

#import "RedView.h"

@implementation RedView

#pragma mark - Override Touches Action -
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"   touchesBegan - %s",__func__);
    NSLog(@"   self: %@",self);
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    //NSLog(@"   touchesMoved - %s",__func__);
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    //NSLog(@"   touchesEnded - %s",__func__);
}


#pragma mark - Override hitTest Methods -
//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    NSLog(@"  %s",__func__);
//
//    if (!self.isUserInteractionEnabled || self.isHidden || self.alpha <= 0.01) {
//        return [super hitTest:point withEvent:event];
//    }
//    else if ([self pointInside:point withEvent:event]) {
//        NSLog(@"  RedView - subviews: %@",self.subviews);
//        UIView *hitTestView = nil;
//        for (UIView *subview in [self.subviews reverseObjectEnumerator]) {
//            NSLog(@"  RedView - subview: %@",subview);
//            CGPoint convertedPoint = [subview convertPoint:point fromView:self];
//            hitTestView = [subview hitTest:convertedPoint withEvent:event];
//            NSLog(@"  RedView - hitTestView: %@",hitTestView);
//            NSLog(@"   ");
//            NSLog(@"   ");
//            if (hitTestView) {
//                if (hitTestView.subviews.count > 0) { // --- (1)
//                    UIView *hitTestView_sub = [hitTestView getContainviewsWithOffsetSize:CGSizeMake(285, 50) inSubviews:hitTestView.subviews withPoint:convertedPoint event:event];
//                    if (hitTestView_sub) {
//                        return hitTestView_sub;
//                    }
//                }
//                else { // --- (2)
//                    UIView *hitTestView_sub = [hitTestView.superview getContainviewsWithOffsetSize:CGSizeMake(285, 50) inSubviews:subview.subviews withPoint:convertedPoint event:event];
//                    if (hitTestView_sub) {
//                        return hitTestView_sub;
//                    }
//                }
//                return hitTestView;
//            }
//            else { // --- (3)
//                UIView *hitTestView = [self getContainviewsWithOffsetSize:CGSizeMake(285, 50) inSubviews:subview.subviews withPoint:convertedPoint event:event];
//                if (hitTestView) {
//                    return hitTestView;
//                }
//                return self;
//            }
//        }
//
//        return self;
//    }
//
//    return [super hitTest:point withEvent:event];
//}

@end
