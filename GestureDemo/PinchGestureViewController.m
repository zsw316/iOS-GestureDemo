//
//  PinchGestureViewController.m
//  GestureDemo
//
//  Created by ShaoweiZhang on 18/2/2017.
//  Copyright © 2017 WSZ. All rights reserved.
//

#import "PinchGestureViewController.h"

@interface PinchGestureViewController ()
{
    UIView *_testView;
}
@end

@implementation PinchGestureViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.navigationItem.title = @"Pinch Gesture";
        self.edgesForExtendedLayout = UIRectEdgeNone;
        
        _testView = [[UIView alloc] init];
        _testView.backgroundColor = [UIColor orangeColor];
        
        UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
        [_testView addGestureRecognizer:pinchGesture];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    _testView.frame = CGRectMake(50, 50, 150, 150);
    [self.view addSubview:_testView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pinch:(UIPinchGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateChanged) {
        _testView.transform = CGAffineTransformMakeScale(gesture.scale, gesture.scale);
        [gesture setScale:1];
    } else if (gesture.state == UIGestureRecognizerStateEnded) {
        _testView.transform = CGAffineTransformIdentity;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
