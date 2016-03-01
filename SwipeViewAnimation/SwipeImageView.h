//
//  SwipeView.h
//  SwipeViewAnimation
//
//  Created by xp_mac on 16/1/13.
//  Copyright © 2016年 xp_mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwipeImageView : UIView

@property (nonatomic,strong) UIImageView *showImageV;
@property (nonatomic,copy) void(^block)(SwipeImageView *);
@property (nonatomic,assign) CGRect viewFrame;

- (instancetype) initWithTheView:(UIView *)mainV;

@end
