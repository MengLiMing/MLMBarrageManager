//
//  ViewController.m
//  BarrageDemo
//
//  Created by 利明孟 on 2017/8/12.
//  Copyright © 2017年 MengLiMing. All rights reserved.
//

#import "ViewController.h"
#import "MLMBarrageManager.h"
#import "Masonry.h"

#define BALLISTIC_COUNT 5

@interface ViewController () <MLMBallisticConfigureDelegate>

@property (nonatomic, strong) MLMBarrageManager *barrageManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}



- (MLMBarrageManager *)barrageManager {
    if (!_barrageManager) {
        _barrageManager = [MLMBarrageManager barrageManager];
        //开启三条弹道
        for (NSInteger i = 0; i < BALLISTIC_COUNT; i ++) {
            MLMBallisticConfigure *ballist = [MLMBallisticConfigure ballisticWithID:i];
            ballist.ballisticLength = CGRectGetWidth([UIScreen mainScreen].bounds);
            ballist.delegate = self;
            [_barrageManager.ballisticArray addObject:ballist];
        }
    }
    return _barrageManager;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self addBarrageManagerWithContent:@"asdadasdasdasdasd"];
}

- (void)addBarrageManagerWithContent:(NSString *)content {
    MLMBallisticConfigure *ballistic = [self.barrageManager minBallistic];
    [ballistic addBarrage:[self createBarrageWithContent:content withBallisticId:ballistic.ballisticId]];
}


- (MLMBarrageConfigure *)createBarrageWithContent:(NSString *)content withBallisticId:(NSInteger)ballisticId {
    CGFloat space = 10;
    __weak typeof(self) weakSelf = self;
    UILabel *label = [UILabel new];
    label.backgroundColor = [UIColor redColor];
    label.text = content;
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view.mas_right).offset(0);
        make.top.equalTo(weakSelf.view.mas_top).offset(ballisticId*(space + 20));
        make.height.equalTo(@20);
    }];
    [label layoutIfNeeded];
    MLMBarrageConfigure *barrage = [MLMBarrageConfigure barrageConfigureView:label withBallistic:ballisticId];
    return barrage;
}


#pragma mark - MLMBallisticConfigureDelegate
- (void)barrageBeginAnimation:(MLMBarrageConfigure *)barrage {
    CGFloat space = 10;
    __weak typeof(self) weakSelf = self;
    [self.view layoutIfNeeded];
    CGFloat width = barrage.barrageView.frame.size.width;
    CGFloat height = barrage.barrageView.frame.size.height;
    
    [barrage.barrageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.view.mas_left).offset(0);
        make.top.equalTo(weakSelf.view.mas_top).offset(barrage.ballistic*(space + 20));
        make.width.equalTo(@(width));
        make.height.equalTo(@(height));
    }];
    [UIView animateWithDuration:barrage.liveTime animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        [barrage.barrageView removeFromSuperview];
    }];
}

@end
