//
//  LJCycleImageView1.m
//  LJCycleImagesDemo
//
//  Created by lemon on 16/5/30.
//  Copyright © 2016年 jinxicheng. All rights reserved.
//
#import "LJCycleImagesView.h"
#import "LJCycleCell.h"
#import "UIImageView+WebCache.h"
#import <UIKit/UIKit.h>

CGFloat viewWidth;

@interface LJCycleImagesView ()<UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate>

@property (strong, nonatomic) UICollectionView  *myCycleView;
@property (strong, nonatomic) NSTimer  *timer;
@property (strong, nonatomic) UIPageControl  *myPageC;
@property (strong, nonatomic) NSIndexPath  *indexPath;

@end
@implementation LJCycleImagesView
// 实现自定义初始化方法
-(instancetype)initWithFrame:(CGRect)frame andImageUrlStringArray:(NSArray *)imageUrlStringArray andPlaceHolderImage:(UIImage *)holderImage andIsAutoCycle:(BOOL)isAutoCycle{
    self = [super initWithFrame:frame];
    if (self) {
        
        viewWidth = frame.size.width;
        
        // 创建轮播视图
        [self setCycleViewWithFrame:frame];
        // 创建pageController
        [self setPageController];
        
        // 设置参数
        // 设置图片下载数组
        self.imageUrlStringArray = imageUrlStringArray;
        // 设置占位图片
        self.placeHolderImage = holderImage;
        
        // 设置pageControl属性
        self.myPageC.numberOfPages = self.imageUrlStringArray.count;
        self.myPageC.currentPage = 0;
        // 添加定时器
        if (isAutoCycle) {
            [self timer];
        }
        // 默认滚动到第一组的第一张
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:1];
        [self.myCycleView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    }
    return self;
}

// 添加轮播视图
-(void)setCycleViewWithFrame:(CGRect)frame{
    // 创建轮播器视图
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(frame.size.width, frame.size.height);
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    // 设置滚动方向
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    UICollectionView *cycleView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
    cycleView.pagingEnabled = YES;
    cycleView.showsHorizontalScrollIndicator = NO;
    cycleView.showsVerticalScrollIndicator = NO;
    // 注册cell 三种方式
    [cycleView registerClass:[LJCycleCell class] forCellWithReuseIdentifier:@"cell"];
    // 设置数据源和代理
    cycleView.dataSource = self;
    cycleView.delegate = self;
    // 添加到父视图
    [self addSubview:cycleView];
    _myCycleView = cycleView;
}
// 添加分页符
- (void)setPageController{
    // 创建
    UIPageControl *pageC = [[UIPageControl alloc]init];
    [self addSubview:pageC];
    pageC.pageIndicatorTintColor = [UIColor whiteColor];
    pageC.currentPageIndicatorTintColor = [UIColor redColor];

    _myPageC = pageC;
    
}
// 布局子控件
-(void)layoutSubviews{
    [super layoutSubviews];
    _myPageC.frame = CGRectMake(0,CGRectGetMaxY(_myCycleView.frame) - 30, _myCycleView.bounds.size.width, 37);
}

#pragma mark - 数据源方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.imageUrlStringArray.count;
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    // 创建cell
    LJCycleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    NSURL *url = self.imageUrlStringArray[indexPath.item];
    [cell.myImageView sd_setImageWithURL:url placeholderImage:self.placeHolderImage];
    cell.userInteractionEnabled = YES;
    // 返回cell
    return cell;
}

#pragma mark - 代理方法
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (decelerate) {
        return;
    }
    else{
        [self scrollviewStop];
        [self timer];
    }
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self scrollviewStop];
    [self timer];
}

// 当图片停下来以后做的判断
- (void)scrollviewStop{
    NSInteger index = self.myCycleView.contentOffset.x / viewWidth;
    // 当前item
    NSInteger currentItem = index % self.imageUrlStringArray.count;
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:currentItem inSection:1];
    // 滚动到第一组的当前item
    [self.myCycleView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    
}
// 实现滚动的代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    // 计算当前是第几页，并设置page的值
    // 获取当前scrollView中的内容滚动到什么位置了
    CGPoint offset = scrollView.contentOffset;
    // 计算当前滚动到第几页 "通过内容水平方向滚动的位置 / scrollView得宽"
    NSInteger page = (offset.x +  viewWidth * 0.5) / viewWidth - self.imageUrlStringArray.count;
    if (page == self.imageUrlStringArray.count ) {
        page = 0;
    }
    
    NSLog(@"page:%zd",page);
    self.myPageC.currentPage = page;
    
}
// 实现自动滚动的方法
- (void)nextPage{
//    NSIndexPath *indexPath = [[self.myCycleView indexPathsForVisibleItems] lastObject];
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.myPageC.currentPage inSection:1];
    // 如果当前不是最后一页就让它跳到下一页
    if (indexPath.item != self.imageUrlStringArray.count - 1) { // 如果不是最后一页
        indexPath = [NSIndexPath indexPathForItem:indexPath.item + 1 inSection:indexPath.section];
        // 如果当前是第1组的最后一页了,我们继续让它走到第2组的第0
    } else {
        indexPath = [NSIndexPath indexPathForItem:0 inSection:indexPath.section + 1];
    }
    // 动画去滚动cell
    [self.myCycleView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    
}
// 开始拖拽的时候停止定时器
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.timer invalidate];
    self.timer = nil;
}

// 使用动画减速停止的时候调用
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    [self scrollviewStop];
}
// 懒加载定时器
- (NSTimer *)timer{
    if (_timer == nil) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
//         开启运行循环
        [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
    return _timer;
}

@end
