//
//  MLMBarrageManager.m
//  BarrageDemo
//
//  Created by 利明孟 on 2017/8/12.
//  Copyright © 2017年 MengLiMing. All rights reserved.
//

#import "MLMBarrageManager.h"
#import <QuartzCore/CADisplayLink.h>

@interface MLMBarrageManager ()

///遍历数组是否可以显示下一条弹幕
@property (nonatomic, strong) CADisplayLink *displayLink;

@end

@implementation MLMBarrageManager

+ (MLMBarrageManager *)barrageManager {
    MLMBarrageManager *manager = [[MLMBarrageManager alloc] init];
    [manager.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    return manager;
}


#pragma mark - get|set
- (CADisplayLink *)displayLink {
    if (!_displayLink) {
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(isCanShow)];
    }
    return _displayLink;
}


#pragma mark - 停止
- (void)stop {
    [self.displayLink invalidate];
    self.displayLink = nil;
}

#pragma mark - 移除所有弹道
- (void)removeAllBallist {
    for (MLMBallisticConfigure *ballistic in self.ballisticArray) {
        [ballistic removeAllBarrage];
    }
}


- (MLMBallisticConfigure *)minBallistic {
    [self.ballisticArray sortUsingComparator:^NSComparisonResult(MLMBallisticConfigure *obj1, MLMBallisticConfigure *obj2) {
        //那个弹道中的弹幕少就添加到哪个弹道,如果弹道数目相同，就按照id排序
        if (obj1.barrageArray.count == obj2.barrageArray.count) {
            return obj1.ballisticId > obj2.ballisticId;
        }
        return obj1.barrageArray.count > obj2.barrageArray.count;
    }];
    return self.ballisticArray.firstObject;
}


#pragma mark - canShow
- (void)isCanShow {
    for (MLMBallisticConfigure *ballistic in self.ballisticArray) {
        if ([ballistic canAddNext]) {
            [ballistic showBarrage];
        }
    }
}

- (NSMutableArray *)ballisticArray {
    if (!_ballisticArray) {
        _ballisticArray = [NSMutableArray array];
    }
    return _ballisticArray;
}

@end
