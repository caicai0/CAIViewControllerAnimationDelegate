//
//  shapeView.m
//  viewController
//
//  Created by liyufeng on 15/1/9.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import "shapeView.h"
#import <QuartzCore/QuartzCore.h>

@implementation shapeView

-(void)reDraw

{
    
    CAShapeLayer *chartLine;
    
    if (chartLine!=nil)
        
    {
        
        [chartLine removeAllAnimations];//这样就能重复绘制饼状图了
        
    }
    
    else
        
    {
        
        chartLine = [CAShapeLayer layer];
        
        chartLine.lineWidth = 10;//这里设置填充线的宽度，这个参数很重要
        
        chartLine.lineCap = kCALineCapButt;//设置线端点样式，这个也是非常重要的一个参数
        
        chartLine.strokeColor = [[UIColor redColor] CGColor];//绘制的线的颜色
        
        chartLine.fillColor = [UIColor blackColor].CGColor;
        
        
        
        self.clipsToBounds = NO;//该属性表示如果图形绘制超过的容器的范围是否被裁掉，这里我们设置为YES ，表示要裁掉超出范围的绘制
        
        [self.layer addSublayer:chartLine];
        
    }
    
    
    
    CGMutablePathRef pathRef  = CGPathCreateMutable();
    
    CGPathAddArc(pathRef, &CGAffineTransformIdentity,
                 
                 CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame)/2, 60, 0, M_PI*2, NO);
    
    chartLine.path = pathRef;
    
    
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    
    pathAnimation.duration = 1.1;//设置绘制动画持续的时间
    
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    
    pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
    
    pathAnimation.autoreverses = NO;//是否翻转绘制
    
    pathAnimation.fillMode = kCAFillModeForwards;
    
    pathAnimation.repeatCount = 1;
    
    
    
    [chartLine addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
    
    chartLine.strokeEnd=1.0f;//表示绘制到百分比多少就停止，这个我们用1表示完全绘制
    
}

@end
