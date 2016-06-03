//
//  LJCycleImageView1.h
//  LJCycleImagesDemo
//
//  Created by lemon on 16/5/30.
//  Copyright © 2016年 jinxicheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJCycleImagesView : UIView



// 图片轮播器需要的图片urlString数组
@property (strong, nonatomic) NSArray  *imageUrlStringArray;
// 占位图片
@property (strong, nonatomic) UIImage  *placeHolderImage;

// 提供初始化方法
- (instancetype)initWithFrame:(CGRect)frame andImageUrlStringArray:(NSArray *)imageUrlStringArray andPlaceHolderImage:(UIImage *)holderImage;

// 提供对象方法，一句话实现图片轮播器
- (void)LJ_addCycleImagesViewWithFrame:(CGRect)frame andImageUrlStringArray:(NSArray *)imageUrlStringArray andPlaceHolderImage:(UIImage *)holderImage;
@end
