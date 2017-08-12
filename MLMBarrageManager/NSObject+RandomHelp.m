//
//  NSObject+RandomHelp.m
//  BarrageDemo
//
//  Created by 利明孟 on 2017/8/12.
//  Copyright © 2017年 MengLiMing. All rights reserved.
//

#import "NSObject+RandomHelp.h"

#define ARC4RANDOM_MAX 0x100000000//arc4random()返回的最大值是 0x100000000

@implementation NSObject (RandomHelp)

//生成随机整数
+ (int)randomIntegerBetween:(int)min and:(int)max {
    int range = max - min;
    if (range == 0) {
        return min;
    }
    return arc4random()%range + min;
}
//生成随机小数
+ (double)randomFloatBetween:(double)min and:(double)max {
    double range = max - min;
    if (range == 0) {
        return min;
    }
    return floorf(((double)arc4random() / ARC4RANDOM_MAX) * range) + min;
}

@end
