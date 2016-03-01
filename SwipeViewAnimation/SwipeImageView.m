//
//  SwipeView.m
//  SwipeViewAnimation
//
//  Created by xp_mac on 16/1/13.
//  Copyright © 2016年 xp_mac. All rights reserved.
//

#import "SwipeImageView.h"

// 获取屏幕高度
#define kDeviceHeight [UIScreen mainScreen].bounds.size.height
// 获取屏幕宽度
#define kDeviceWidth  [UIScreen mainScreen].bounds.size.width

@interface SwipeImageView ()

@property (nonatomic,assign) CGPoint centerPoint;

@end

@implementation SwipeImageView

- (instancetype) initWithTheView:(UIView *)mainV
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _viewFrame = frame;
        
        //图片
        self.backgroundColor = [UIColor clearColor];
        _showImageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _showImageV.clipsToBounds = YES;
        _showImageV.layer.cornerRadius = 10;
        [self addSubview:_showImageV];
        
        //添加滑动手势
        UISwipeGestureRecognizer *swipeGestue = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeDown:)];
        swipeGestue.direction = UISwipeGestureRecognizerDirectionDown;
        [self addGestureRecognizer:swipeGestue];
        
    }
    return self;
}

#pragma mark - setter methods
- (void) setViewFrame:(CGRect)rect
{
    _viewFrame = rect;
    _showImageV.frame = CGRectMake(0, 0, rect.size.width, rect.size.height);
}

//手势动画
- (void) swipeDown:(UISwipeGestureRecognizer *)swipeG
{
    [UIView animateWithDuration:0.5 animations:^{
        //拖动后使view往下掉，从视图中消失
        self.center = CGPointMake(kDeviceWidth/2, kDeviceHeight+150);
    } completion:^(BOOL finished) {
        //使view放在视图的顶部
        self.center = CGPointMake(kDeviceWidth/2, -60);
        if (self.block) {
            self.block(self);
        }
    }];
}

@end
