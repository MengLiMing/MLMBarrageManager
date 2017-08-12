//
//  MLMBarrageManager.h
//  BarrageDemo
//
//  Created by 利明孟 on 2017/8/12.
//  Copyright © 2017年 MengLiMing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MLMBallisticConfigure.h"
#import "MLMBarrageConfigure.h"

@interface MLMBarrageManager : NSObject

///弹道数组
@property (nonatomic, strong) NSMutableArray <MLMBallisticConfigure *> *ballisticArray;

+ (MLMBarrageManager *)barrageManager;

///获取弹幕最少的弹道
- (MLMBallisticConfigure *)minBallistic;
///停止
- (void)stop;
///移除所有弹道
- (void)removeAllBallist;

@end
