//
//  GreenView.m
//  TestProject
//
//  Created by Avery An on 2019/7/10.
//  Copyright © 2019 Avery An. All rights reserved.
//

#import "GreenView.h"

@implementation GreenView

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

@end
