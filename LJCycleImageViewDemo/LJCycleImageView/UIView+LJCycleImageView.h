//
//  UIView+LJCycleImageView.h
//  LJCycleImagesDemo
//
//  Created by lemon on 16/6/2.
//  Copyright © 2016年 jinxicheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LJCycleImageView)
// 通过view的分类方法，实现一句话添加轮播器的功能
- (void)LJ_setCycleImageViewWithFrame:(CGRect)frame andImageUrlStringArray:(NSArray *)imageUrlStringArray andPlaceHolderImage:(UIImage *)holderImage;
@end
