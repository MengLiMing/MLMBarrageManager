//
//  MLMBarrageConfigure.h
//  BarrageDemo
//
//  Created by 利明孟 on 2017/8/12.
//  Copyright © 2017年 MengLiMing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//单个弹幕配置
@interface MLMBarrageConfigure : NSObject

///所在弹道
@property (nonatomic, assign) NSInteger ballistic;
///弹幕视图
@property (nonatomic, strong) UIView *barrageView;
///弹幕开始时间
@property (nonatomic, assign) NSTimeInterval beginTime;
///弹幕存活时间
@property (nonatomic, assign) NSTimeInterval liveTime;
///弹幕移出屏幕的事件
@property (nonatomic, assign) NSTimeInterval outScreenTime;


+ (MLMBarrageConfigure *)barrageConfigureView:(UIView *)view withBallistic:(NSInteger)ballistic;

@end
