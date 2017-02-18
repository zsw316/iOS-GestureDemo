//
//  GestureConditionViewController.m
//  GestureDemo
//
//  Created by ShaoweiZhang on 18/2/2017.
//  Copyright © 2017 WSZ. All rights reserved.
//

#import "GestureConditionViewController.h"

@interface GestureConditionViewController () <UIGestureRecognizerDelegate>
{
    UIView *_superTestView;
    UIView *_subTestView;
    UITapGestureRecognizer *_tapGestureRecognizer;
}
@end

@implementation GestureConditionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"Gesture Condition";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    
    _superTestView = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 200, 200)];
    _superTestView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_superTestView];
    
    _subTestView = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 100, 100)];
    _subTestView.backgroundColor = [UIColor orangeColor];
    [_superTestView addSubview:_subTestView];
    
    _tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [_superTestView addGestureRecognizer:_tapGestureRecognizer];
    
    _tapGestureRecognizer.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tap:(UITapGestureRecognizer *)gesture {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:@"Tap gesture detected" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alertController animated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer == _tapGestureRecognizer) {
        CGPoint location = [gestureRecognizer locationInView:_superTestView];
        if (CGRectContainsPoint(_subTestView.frame, location)) {
            return NO;
        }
    }
    
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if (gestureRecognizer == _tapGestureRecognizer) {
        if (touch.view != _superTestView && [touch.view isDescendantOfView:_superTestView]) {
            return NO;
        }
    }
    
    return YES;
}


@end
