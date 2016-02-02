//
//  ViewController.m
//  Ruler
//
//  Created by 呜拉巴哈 on 16/2/1.
//  Copyright © 2016年 http://www.swiftnews.cn . All rights reserved.
//

#import "ViewController.h"
#import "AHRuler.h"
#define HOMECOLOR [UIColor colorWithRed:53/255.0 green:153/255.0 blue:54/255.0 alpha:1]
#define degreesToRadian(x) (M_PI * (x) / 180.0)

@interface ViewController ()<AHRrettyRulerDelegate>

@end

@implementation ViewController{
    UILabel *showLabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.创建一个显示的标签
    showLabel = [[UILabel alloc] init];
    showLabel.font = [UIFont boldSystemFontOfSize:40.f];
    showLabel.text = @"60kg";
    showLabel.textColor = HOMECOLOR;
    
    showLabel.frame = CGRectMake(20, 50, [UIScreen mainScreen].bounds.size.width - 20 * 2, 50);
    showLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:showLabel];

    
    // 2.创建 AHRuler 对象 并设置代理对象
    AHRuler *ruler = [[AHRuler alloc] initWithFrame:CGRectMake(20, 220, [UIScreen mainScreen].bounds.size.width - 20 * 2, 140)];
    ruler.rulerDeletate = self;
    [ruler showRulerScrollViewWithCount:150 average:[NSNumber numberWithFloat:1] currentValue:60.f smallMode:YES];

    //旋转竖着显示
//    ruler.transform = CGAffineTransformMakeRotation(degreesToRadian(-90));
    [self.view addSubview:ruler];

}

- (void)ahRuler:(AHRulerScrollView *)rulerScrollView {
    showLabel.text = [NSString stringWithFormat:@"%.fkg",rulerScrollView.rulerValue];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
