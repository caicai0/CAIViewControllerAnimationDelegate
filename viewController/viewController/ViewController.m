//
//  ViewController.m
//  viewController
//
//  Created by liyufeng on 15/1/7.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "CAIViewControllerAnimationDelegate.h"
#import "shapeView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) IBOutlet CAIViewControllerAnimationDelegate *transitionDelegate;

- (IBAction)back:(UIBarButtonItem *)sender;
@property (nonatomic,strong)CAIViewControllerAnimationDelegate * animationDelegate;

@end

@implementation ViewController

- (void)awakeFromNib{
    [super awakeFromNib];
    self.animationDelegate = [[CAIViewControllerAnimationDelegate alloc]init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    float width = self.view.bounds.size.width;
    float height = self.view.bounds.size.height;
    
    CAShapeLayer * shapeLayer = [CAShapeLayer layer];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path,NULL, width, 0);
    CGPathAddLineToPoint(path, NULL, width, height);
    CGPathAddLineToPoint(path, NULL, width, 0);
    CGPathAddQuadCurveToPoint(path, NULL, width, 0, width, 0);
    CGPathAddLineToPoint(path, NULL, 0, 0);
    [shapeLayer setPath:path];
    shapeLayer.lineCap = kCALineCapRound;
    [shapeLayer setStrokeColor:[[UIColor blackColor] CGColor]];
    [shapeLayer setLineWidth:0];
    [shapeLayer setLineJoin:kCALineCapButt];
    [shapeLayer setLineDashPattern:
     [NSArray arrayWithObjects:[NSNumber numberWithInt:50], [NSNumber numberWithInt:2],
      nil]];
    self.imageView.layer.mask = shapeLayer;
    
    
    CGMutablePathRef toPath = CGPathCreateMutable();
    CGPathMoveToPoint(toPath, NULL, 0, 0);
    CGPathAddLineToPoint(toPath, NULL, width, 0);
    CGPathAddLineToPoint(toPath, NULL, width, height);
    CGPathAddLineToPoint(toPath, NULL, 0, height);
    CGPathAddQuadCurveToPoint(toPath, NULL, 0, height, 0, height);
    CGPathAddLineToPoint(toPath, NULL, 0, 0);
    
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    
    pathAnimation.duration = 1.1;//设置绘制动画持续的时间
    
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    pathAnimation.fromValue = (__bridge id)(path);
    
    pathAnimation.toValue = (__bridge id)(toPath);
    
    pathAnimation.autoreverses = NO;//是否翻转绘制
    
    pathAnimation.fillMode = kCAFillModeForwards;
    
    pathAnimation.repeatCount = 1;
    
    
    
    
    
    
    
    
    CAKeyframeAnimation * keyFrameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"path"];
    keyFrameAnimation.duration = 1;
    keyFrameAnimation.values = [self paths];
    [shapeLayer addAnimation:keyFrameAnimation forKey:nil];
    
    shapeLayer.path = toPath;
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSArray *)paths{
    float width = self.view.bounds.size.width;
    float height = self.view.bounds.size.height;
    height = height - 64;
    NSMutableArray * arr = [NSMutableArray array];
    
    CGMutablePathRef keyPath = CGPathCreateMutable();
    CGPathMoveToPoint(keyPath, NULL, 0, 0);
    CGPathAddLineToPoint(keyPath, NULL, width, 0);
    CGPathAddLineToPoint(keyPath, NULL, width, height);
    CGPathAddLineToPoint(keyPath, NULL, width, 0);
    CGPathAddQuadCurveToPoint(keyPath, NULL, width, 0, width, 0);
    CGPathAddLineToPoint(keyPath, NULL, 0, 0);
    
    [arr addObject:(__bridge id)(keyPath)];
    
    keyPath = CGPathCreateMutable();
    CGPathMoveToPoint(keyPath, NULL, 0, 0);
    CGPathAddLineToPoint(keyPath, NULL, width, 0);
    CGPathAddLineToPoint(keyPath, NULL, width, height);
    CGPathAddLineToPoint(keyPath, NULL, width, height);
    CGPathAddQuadCurveToPoint(keyPath, NULL, width, 0, 0, 0);
    CGPathAddLineToPoint(keyPath, NULL, 0, 0);
    
    [arr addObject:(__bridge id)(keyPath)];
    
    keyPath = CGPathCreateMutable();
    CGPathMoveToPoint(keyPath, NULL, 0, 0);
    CGPathAddLineToPoint(keyPath, NULL, width, 0);
    CGPathAddLineToPoint(keyPath, NULL, width, height);
    CGPathAddLineToPoint(keyPath, NULL, width, height);
    CGPathAddQuadCurveToPoint(keyPath, NULL, 0, height, 0, 0);
    CGPathAddLineToPoint(keyPath, NULL, 0, 0);
    
    [arr addObject:(__bridge id)(keyPath)];
    
    keyPath = CGPathCreateMutable();
    CGPathMoveToPoint(keyPath, NULL, 0, 0);
    CGPathAddLineToPoint(keyPath, NULL, width, 0);
    CGPathAddLineToPoint(keyPath, NULL, width, height);
    CGPathAddLineToPoint(keyPath, NULL, 0, height);
    CGPathAddQuadCurveToPoint(keyPath, NULL, 0, height, 0, height);
    CGPathAddLineToPoint(keyPath, NULL, 0, height);
    CGPathAddLineToPoint(keyPath, NULL, 0, 0);
    
    [arr addObject:(__bridge id)(keyPath)];
    
    return arr;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController * to = segue.destinationViewController;
    to.transitioningDelegate = self.transitionDelegate;
    [super prepareForSegue:segue sender:sender];
}



@end
