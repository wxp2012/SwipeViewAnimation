//
//  ViewController.m
//  SwipeViewAnimation
//
//  Created by xp_mac on 16/1/13.
//  Copyright © 2016年 xp_mac. All rights reserved.
//

#import "MainViewController.h"
#import "SwipeImageView.h"
#import "UIColor+RandomColor.h"

// 获取屏幕高度
#define kDeviceHeight [UIScreen mainScreen].bounds.size.height
// 获取屏幕宽度
#define kDeviceWidth  [UIScreen mainScreen].bounds.size.width

#define DEFAULT_NUMBER 3
#define Height  300
#define Width  250

@interface MainViewController ()

@property (nonatomic,copy) NSMutableArray *viewArr;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _viewArr = [NSMutableArray array];
    
    for (int i = 0; i < DEFAULT_NUMBER; i++) {
        SwipeImageView *swipeV = [[SwipeImageView alloc] initWithFrame:CGRectMake(((kDeviceWidth - Width)/2 + 20*(DEFAULT_NUMBER-i)), ((kDeviceHeight - Height)/2 - 20*(DEFAULT_NUMBER-i)), Width - 20*(DEFAULT_NUMBER-i)*2, Height - 20*(DEFAULT_NUMBER-i)*2)];
        swipeV.showImageV.backgroundColor = [UIColor randomColor];
        swipeV.tag = i;
        swipeV.alpha = (i+1)*0.3<=0.9?(i+1)*0.3+0.1:(i+1)*0.3;
        [self.view addSubview:swipeV];
        
        //用户只可以划动第一个，其余各个禁止划动
        if (i == 2) {
            swipeV.userInteractionEnabled = YES;
        }
        else
        {
            swipeV.userInteractionEnabled = NO;
        }
        
        [_viewArr addObject:swipeV];
        
        swipeV.block = ^(SwipeImageView *theImageV)
        {
            //第一张放到最后面
            [UIView animateWithDuration:0.5 delay:0.1 options:UIViewAnimationOptionCurveEaseOut animations:^{
                SwipeImageView *changeV = [[SwipeImageView alloc] init];
                changeV = _viewArr[2];
                changeV.frame = CGRectMake(((kDeviceWidth - Width)/2 + 60), ((kDeviceHeight - Height)/2 - 60), (Width - 20*(DEFAULT_NUMBER-0)*2), (Height - 20*(DEFAULT_NUMBER-0)*2));
                changeV.viewFrame = CGRectMake(0, 0, (Width - 20*(DEFAULT_NUMBER-0)*2), (Height - 20*(DEFAULT_NUMBER-0)*2));
                [self.view sendSubviewToBack:changeV];
                [_viewArr removeLastObject];
                changeV.tag = 0;
                changeV.alpha = (0+1)*0.3;
                changeV.userInteractionEnabled = NO;
                [_viewArr insertObject:changeV atIndex:0];
            } completion:^(BOOL finished) {
                //第二、三张依次往前推
                [UIView animateWithDuration:0.5 delay:0.1 options:UIViewAnimationOptionCurveEaseOut animations:^{
                    [self changeViewFrame:DEFAULT_NUMBER - 1 withEnabled:YES];
                } completion:^(BOOL finished) {
                    
                }];
                
                [UIView animateWithDuration:0.5 delay:0.1 options:UIViewAnimationOptionCurveEaseOut animations:^{
                    [self changeViewFrame:DEFAULT_NUMBER - 2 withEnabled:NO];
                    
                } completion:^(BOOL finished) {
                    
                }];
            }];
        };
    }
    
}

//往前推时改变frame
- (void) changeViewFrame:(NSInteger)index withEnabled:(BOOL)b
{
    SwipeImageView *changeV = [[SwipeImageView alloc] init];
    changeV = _viewArr[index];
    changeV.frame = CGRectMake(((kDeviceWidth - Width)/2 + 20*(DEFAULT_NUMBER-index)), ((kDeviceHeight - Height)/2 - 20*(DEFAULT_NUMBER-index)), (Width - 20*(DEFAULT_NUMBER-index)*2), (Height - 20*(DEFAULT_NUMBER-index)*2));
    changeV.viewFrame = CGRectMake(0, 0, (Width - 20*(DEFAULT_NUMBER-index)*2), (Height - 20*(DEFAULT_NUMBER-index)*2));
    changeV.tag = index;
    changeV.alpha = (index+1)*0.3<=0.9?(index+1)*0.3+0.1:(index+1)*0.3;
    changeV.userInteractionEnabled = b;
    [_viewArr replaceObjectAtIndex:index withObject:changeV];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
