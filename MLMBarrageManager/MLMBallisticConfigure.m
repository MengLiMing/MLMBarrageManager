//
//  MLMBallisticConfigure.m
//  BarrageDemo
//
//  Created by 利明孟 on 2017/8/12.
//  Copyright © 2017年 MengLiMing. All rights reserved.
//

#import "MLMBallisticConfigure.h"
#import "NSObject+RandomHelp.h"

///弹道间隔时间
static const NSTimeInterval minSpace = .3;
static const NSTimeInterval maxSpace = 2.0;

@interface MLMBallisticConfigure ()
{
    //beginTIme
    NSTimeInterval next_begin;
}



@end

@implementation MLMBallisticConfigure


#pragma mark - init
+ (MLMBallisticConfigure *)ballisticWithID:(NSInteger)ballisticId {
    MLMBallisticConfigure *configure = [[MLMBallisticConfigure alloc] init];
    configure.ballisticId = ballisticId;
    return configure;
}


#pragma mark - get|set
- (NSMutableArray *)barrageArray {
    if (!_barrageArray) {
        _barrageArray = [NSMutableArray array];
    }
    return _barrageArray;
}

#pragma mark - 移除所有弹幕
- (void)removeAllBarrage {
    for (MLMBarrageConfigure *barrage in self.barrageArray) {
        [barrage.barrageView removeFromSuperview];
    }
}

#pragma mark - 装填弹幕
- (void)addBarrage:(MLMBarrageConfigure *)barrage {
    //弹幕全部移出屏幕的时间
    CGFloat view_width = CGRectGetWidth(barrage.barrageView.frame);
    barrage.outScreenTime = barrage.liveTime*view_width/(self.ballisticLength + view_width);
    [self.barrageArray addObject:barrage];
}

#pragma mark - 判断是否可以显示下一个
- (BOOL)canAddNext {
    return [[NSDate date] timeIntervalSince1970]-next_begin>=0;
}

#pragma mark - 开始动画
- (void)showBarrage {
    if (self.delegate && [self.delegate respondsToSelector:@selector(barrageBeginAnimation:)] && self.barrageArray.count) {
        @synchronized (self.barrageArray) {
            NSTimeInterval time = [[NSDate date] timeIntervalSince1970];
            MLMBarrageConfigure *barrage = self.barrageArray.firstObject;
            //动画开始是设置每个弹幕的动画开始时间
            barrage.beginTime = time;
            [self.delegate barrageBeginAnimation:barrage];
            [self.barrageArray removeObject:barrage];
            //下一个弹幕的开始时间=弹幕全部移出屏幕的时间+间隔
            next_begin = barrage.beginTime + barrage.outScreenTime + [self barrage_time_space];
        }
    }
}

#pragma mark - 弹道间隔时间
- (NSTimeInterval)barrage_time_space {
    return [NSObject randomFloatBetween:minSpace and:maxSpace];
}

@end

