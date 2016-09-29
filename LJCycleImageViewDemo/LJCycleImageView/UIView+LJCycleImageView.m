//
//  UIView+LJCycleImageView.m
//  LJCycleImagesDemo
//
//  Created by lemon on 16/6/2.
//  Copyright © 2016年 jinxicheng. All rights reserved.
//

#import "UIView+LJCycleImageView.h"
#import "LJCycleImagesView.h"

@implementation UIView (LJCycleImageView)
-(void)LJ_setCycleImageViewWithFrame:(CGRect)frame andImageUrlStringArray:(NSArray *)imageUrlStringArray andPlaceHolderImage:(UIImage *)holderImage andIsAutoCycle:(BOOL) isAutoCycle{
    // 创建轮播器
    LJCycleImagesView *cycleImageView = [[LJCycleImagesView alloc] initWithFrame:frame andImageUrlStringArray:imageUrlStringArray andPlaceHolderImage:holderImage andIsAutoCycle:isAutoCycle];
    // 将轮播器添加到调用的view上
    [self addSubview:cycleImageView];

}
@end
