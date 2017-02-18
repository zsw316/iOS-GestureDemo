//
//  GesturePriorityViewController.m
//  GestureDemo
//
//  Created by ShaoweiZhang on 18/2/2017.
//  Copyright © 2017 WSZ. All rights reserved.
//

#import "GesturePriorityViewController.h"

@interface GesturePriorityViewController () <UIGestureRecognizerDelegate>
{
    UIView *_testView;
    UIPanGestureRecognizer *_panGestureRecognizer;
    UISwipeGestureRecognizer *_swipeGestureRecognizer;
}
@end

@implementation GesturePriorityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    _testView = [[UIView alloc] init];
    _testView.backgroundColor = [UIColor orangeColor];
    _testView.frame = CGRectMake(50, 50, 150, 150);
    
    [self.view addSubview:_testView];
    
    _panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [_testView addGestureRecognizer:_panGestureRecognizer];
    
    _swipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    _swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft | UISwipeGestureRecognizerDirectionRight;
    [_testView addGestureRecognizer:_swipeGestureRecognizer];
    
    // Set priority option 1: using requireGestureRecognizerToFail
//    [_panGestureRecognizer requireGestureRecognizerToFail:_swipeGestureRecognizer];
    
    // Set priority option 2: using delegate
    _panGestureRecognizer.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pan:(UIPanGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateChanged) {
        CGPoint translationPoint = [gesture translationInView:self.view];
        _testView.transform = CGAffineTransformMakeTranslation(translationPoint.x, translationPoint.y);
    } else if (gesture.state == UIGestureRecognizerStateEnded) {
        _testView.transform = CGAffineTransformIdentity;
    }
}

- (void)swipe:(UISwipeGestureRecognizer *)gesture {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:@"Swipe detected" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil]];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
}

#pragma mark gesture recognizer delegate
// gestureRecognizer < otherGestureRecognizer
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    if (gestureRecognizer == _panGestureRecognizer && otherGestureRecognizer == _swipeGestureRecognizer) {
        return YES;
    }
    
    return NO;
}

//// gestureRecognizer > otherGestureRecognizer
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
//    f (gestureRecognizer == _panGestureRecognizer && otherGestureRecognizer == _swipeGestureRecognizer) {
//        return YES;
//    }
//    
//    return NO;
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
