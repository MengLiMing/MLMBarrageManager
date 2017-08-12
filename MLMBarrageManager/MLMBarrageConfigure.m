//
//  MLMBarrageConfigure.m
//  BarrageDemo
//
//  Created by 利明孟 on 2017/8/12.
//  Copyright © 2017年 MengLiMing. All rights reserved.
//

#import "MLMBarrageConfigure.h"

@implementation MLMBarrageConfigure

+ (MLMBarrageConfigure *)barrageConfigureView:(UIView *)view withBallistic:(NSInteger)ballistic {
    MLMBarrageConfigure *configure = [[MLMBarrageConfigure alloc] init];
    configure.liveTime = 5;
    configure.ballistic = ballistic;
    configure.barrageView = view;
    return configure;
}


@end
