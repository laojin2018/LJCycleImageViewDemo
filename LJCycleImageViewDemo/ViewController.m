//
//  ViewController.m
//  LJCycleImageViewDemo
//
//  Created by lemon on 16/6/3.
//  Copyright © 2016年 jinxicheng. All rights reserved.
//

#import "ViewController.h"
#import "UIView+LJCycleImageView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 使用框架直接添加无限轮播器
    NSArray *imagesURLStrings = @[
                                  @"http://h.hiphotos.baidu.com/image/pic/item/fcfaaf51f3deb48f439b2b0bf41f3a292cf57871.jpg",
                                  @"http://imgsrc.baidu.com/baike/pic/item/6391e90384f5a4b009fa9373.jpg",
                                  @"http://imgsrc.baidu.com/forum/pic/item/4610b912c8fcc3ce47a6ba909245d688d43f202a.jpg",
                                  @"http://s7.sinaimg.cn/mw690/003XyogQgy6RjANESfI36&690",
                                  @"http://imgsrc.baidu.com/forum/w%3D580/sign=de763bd657e736d158138c00ab514ffc/5b4e83eef01f3a294b8da0c49a25bc315c607c09.jpg",
                                  @"http://image.tianjimedia.com/uploadImages/2012/202/WA404O67HUAW_1000x500.jpg",
                                  @"http://image.tianjimedia.com/uploadImages/2015/059/18/I380XA478T4U.jpg"
                                  @"http://e.hiphotos.baidu.com/image/h%3D200/sign=c898bddf19950a7b6a3549c43ad0625c/14ce36d3d539b600be63e95eed50352ac75cb7ae.jpg"
                                  ];
    [self.view LJ_setCycleImageViewWithFrame:CGRectMake(0, 0, 375, 600) andImageUrlStringArray:imagesURLStrings andPlaceHolderImage:[UIImage imageNamed:@"placeholder"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
