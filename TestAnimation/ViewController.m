//
//  ViewController.m
//  TestAnimation
//
//  Created by Ray D. on 2015/6/18.
//  Copyright (c) 2015年 LikeABossApp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    BOOL isAnimate;
}
@property (weak, nonatomic) IBOutlet UIImageView *imgFingerPoint;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnAnimate:(id)sender {
    if (!isAnimate) {
        [self animateTheImage];
        isAnimate = YES;
    }else{
        [self stopAnimate];
        isAnimate = NO;
    }
}

- (void)animateTheImage{
    //set the origin frame
    CGRect frame = self.imgFingerPoint.frame;
    
    frame.origin.x -= 15;
    
    //begin animation
    [UIView animateKeyframesWithDuration:1.f delay:0.f options:UIViewKeyframeAnimationOptionAutoreverse | UIViewKeyframeAnimationOptionRepeat animations:^{
        //first move for animation,begin with 0 second
        [UIView addKeyframeWithRelativeStartTime:0.f relativeDuration:0.5 animations:^{
            self.imgFingerPoint.frame = frame;
        }];
        
        //second move for animation,begin with 0.5 second
        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0.5 animations:^{
            CGRect animateFrame = self.imgFingerPoint.frame;
            animateFrame.origin.x += 15;
            self.imgFingerPoint.frame = animateFrame;
        }];
        
    } completion:nil];
}

- (void)stopAnimate{
    //stop all animation on current view
    [self.imgFingerPoint.layer removeAllAnimations];
}

@end
