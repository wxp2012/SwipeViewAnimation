//
//  UIColor+RandomColor.m
//  SwipeViewAnimation
//
//  Created by xp_mac on 16/1/13.
//  Copyright © 2016年 xp_mac. All rights reserved.
//

#import "UIColor+RandomColor.h"

@implementation UIColor (RandomColor)

+ (UIColor *)randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 ); //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; //0.5 to 1.0
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end
