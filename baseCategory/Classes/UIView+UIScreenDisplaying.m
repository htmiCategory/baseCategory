//
//  UIView+UIScreenDisplaying.m
//  MXClient
//
//  Created by wlq on 16/6/2.
//  Copyright © 2016年 MXClient. All rights reserved.
//

#import "UIView+UIScreenDisplaying.h"

@implementation UIView (UIScreenDisplaying)

// 判断View是否显示在屏幕上
- (BOOL)isDisplayedInScreen
{
    if (self == nil) {
        return FALSE;
    }
    
    CGRect screenRect = [UIScreen mainScreen].bounds;
    
    // 转换view对应window的Rect
    CGRect rect = [self convertRect:self.frame fromView:nil];
    if (CGRectIsEmpty(rect) || CGRectIsNull(rect)) {
        return FALSE;
    }
    
    // 若view 隐藏
    if (self.hidden) {
        return FALSE;
    }
    
    // 若没有superview
    if (self.superview == nil) {
        return FALSE;
    }
    
    // 若size为CGrectZero
    if (CGSizeEqualToSize(rect.size, CGSizeZero)) {
        return  FALSE;
    }
    
    // 获取 该view与window 交叉的 Rect
    CGRect intersectionRect = CGRectIntersection(rect, screenRect);
    if (CGRectIsEmpty(intersectionRect) || CGRectIsNull(intersectionRect)) {
        return FALSE;
    }
    
    return TRUE;
}

@end
