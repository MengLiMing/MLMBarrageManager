//
//  NSObject+RandomHelp.h
//  BarrageDemo
//
//  Created by 利明孟 on 2017/8/12.
//  Copyright © 2017年 MengLiMing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (RandomHelp)


///生成随机整数
+ (int)randomIntegerBetween:(int)min and:(int)max;
///生成随机小数
+ (double)randomFloatBetween:(double)min and:(double)max;

@end
