//
//  MLMBallisticConfigure.h
//  BarrageDemo
//
//  Created by 利明孟 on 2017/8/12.
//  Copyright © 2017年 MengLiMing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MLMBarrageConfigure.h"

@protocol MLMBallisticConfigureDelegate <NSObject>

///弹道开始动画
- (void)barrageBeginAnimation:(MLMBarrageConfigure *)barrage;


@end

///单个弹道配置
@interface MLMBallisticConfigure : NSObject

///当前弹道ID
@property (nonatomic, assign) NSInteger ballisticId;
///弹道长度
@property (nonatomic, assign) CGFloat ballisticLength;


///当前弹道展示中的弹幕数组
@property (nonatomic, strong) NSMutableArray *barrageArray;

@property (nonatomic, weak) id <MLMBallisticConfigureDelegate> delegate;


+ (MLMBallisticConfigure *)ballisticWithID:(NSInteger)ballisticId;

///装填弹幕
- (void)addBarrage:(MLMBarrageConfigure *)barrage;
///可以添加下一个
- (BOOL)canAddNext;
///开始动画
- (void)showBarrage;
///移除所有弹幕
- (void)removeAllBarrage;

@end
