//
//  LJCycleCell.m
//  LJCycleScrollImages
//
//  Created by lemon on 16/5/28.
//  Copyright © 2016年 jinxicheng. All rights reserved.
//

#import "LJCycleCell.h"

@interface LJCycleCell ()

@end
@implementation LJCycleCell
// 重写初始化方法
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 创建图片框
        UIImageView *cycleImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:cycleImageView];
        cycleImageView.userInteractionEnabled = YES;
        _myImageView = cycleImageView;
        
//        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
//        [cycleImageView addGestureRecognizer:tap];
    }
    return self;
}

//-(void)tap{
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"TEST" object:nil];
//}

// 布局
-(void)layoutSubviews{
    [super layoutSubviews];
    _myImageView.frame = self.bounds;
}

@end








