//
//  UIView+HitTestPublicMethods.m
//  TestProject
//
//  Created by Avery An on 2019/7/17.
//  Copyright © 2019 Avery An. All rights reserved.
//

#import "UIView+HitTestPublicMethods.h"

@interface UIView (HitTest_Private)
@property (nonatomic) NSMutableArray *containViews;
@end

@implementation UIView (HitTestPublicMethods)

#pragma mark - Public Methods -
- (UIView *)default_hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (!self.isUserInteractionEnabled || self.isHidden || self.alpha <= 0.01) {
        return nil;
    }
    else if ([self pointInside:point withEvent:event]) {
        for (UIView *subView in [self.subviews reverseObjectEnumerator]) {
            CGPoint convertedPoint = [subView convertPoint:point fromView:self];
            UIView *hitTestView = [subView hitTest:convertedPoint withEvent:event];
            if (hitTestView) {
                return hitTestView;
            }
        }
        return self;
    }
    return nil;
}
- (id)getContainviewsInSubview:(UIView *)subView
                     withPoint:(CGPoint)point
                         event:(UIEvent *)event {
    @autoreleasepool {
        if (!self.containViews) {
            self.containViews = [NSMutableArray arrayWithCapacity:0];
        }
        
        // 判断当前的subView是否可以响应:
        if ([subView pointInside:point withEvent:event]) {
            [self.containViews addObject:subView];
            subView.depth = self.containViews.count;
        }
        
        // 从当前subView的子视图中查找可以响应的视图:
        [self processSubviews:subView.subviews withPoint:point event:event];
        
        id __autoreleasing tapedView = [self.containViews lastObject];
        [self.containViews removeAllObjects];
        return tapedView;
    }
}


#pragma mark - Private Methods -
- (void)processSubviews:(NSArray *)subviews
              withPoint:(CGPoint)point
                  event:(UIEvent *)event {
    @autoreleasepool {
        for (int i = 0; i < subviews.count; i++) {
            UIView *subView = [subviews objectAtIndex:i];
            if ([subView isKindOfClass:[UIResponder class]] &&
                subView.isUserInteractionEnabled &&
                !subView.isHidden &&
                subView.alpha - 0.01 >= 0) {
                CGPoint convertedPoint = [subView convertPoint:point fromView:subView.superview];
                if ([subView pointInside:convertedPoint withEvent:event]) {
                    [self.containViews addObject:subView];
                    subView.depth = self.containViews.count;
                    
                    if (subView.subviews.count > 0) {
                        [self processSubviews:subView.subviews
                                    withPoint:convertedPoint
                                        event:event];
                    }
                }
                else if (subView.needProcessSubviewHitTest == YES || FORCED_ProcessSubviewHitTest) {
                    if (subView.subviews.count > 0) {
                        [self processSubviews:subView.subviews
                                    withPoint:convertedPoint
                                        event:event];
                    }
                }
            }
        }
    }
}


#pragma mark - Properties -
- (void)setNeedProcessSubviewHitTest:(BOOL)needProcessSubviewHitTest {
    objc_setAssociatedObject(self, @selector(needProcessSubviewHitTest), @(needProcessSubviewHitTest), OBJC_ASSOCIATION_ASSIGN);
}
- (BOOL)needProcessSubviewHitTest {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setDepth:(NSInteger)depth {
    objc_setAssociatedObject(self, @selector(depth), @(depth), OBJC_ASSOCIATION_ASSIGN);
}
- (NSInteger)depth {
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}

- (void)setContainViews:(NSMutableArray *)containViews {
    objc_setAssociatedObject(self, @selector(containViews), containViews, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSMutableArray *)containViews {
    return objc_getAssociatedObject(self, _cmd);
}

@end
