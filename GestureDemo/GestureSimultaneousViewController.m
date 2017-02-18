//
//  GestureSimultaneousViewController.m
//  GestureDemo
//
//  Created by ShaoweiZhang on 18/2/2017.
//  Copyright © 2017 WSZ. All rights reserved.
//

#import "GestureSimultaneousViewController.h"

@interface GestureSimultaneousViewController () <UIGestureRecognizerDelegate>
{
    UIView *_testView;
    UIPinchGestureRecognizer *_pinchGestureRecognizer;
    UIRotationGestureRecognizer *_rotationGestureRecognizer;
}
@end

@implementation GestureSimultaneousViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Simultaneous";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    
    _testView = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 150, 150)];
    _testView.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:_testView];
    
    _pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    [_testView addGestureRecognizer:_pinchGestureRecognizer];
    
    _rotationGestureRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotation:)];
    [_testView addGestureRecognizer:_rotationGestureRecognizer];
    
    _pinchGestureRecognizer.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pinch:(UIPinchGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateChanged) {
        _testView.transform = CGAffineTransformScale(_testView.transform, gesture.scale, gesture.scale);
        [gesture setScale:1];
    }
}

- (void)rotation:(UIRotationGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateChanged) {
        _testView.transform = CGAffineTransformRotate(_testView.transform, gesture.rotation);
        [gesture setRotation:0];
    }
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
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
