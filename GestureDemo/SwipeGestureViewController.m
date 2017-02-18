//
//  SwipeGestureViewController.m
//  GestureDemo
//
//  Created by ShaoweiZhang on 18/2/2017.
//  Copyright © 2017 WSZ. All rights reserved.
//

#import "SwipeGestureViewController.h"

@interface SwipeGestureViewController ()
{
    UIView *_testView;
}

@end

@implementation SwipeGestureViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.navigationItem.title = @"Swipe Gesture";
        self.edgesForExtendedLayout = UIRectEdgeNone;
        
        _testView = [[UIView alloc] init];
        _testView.backgroundColor = [UIColor orangeColor];
        
        UISwipeGestureRecognizer *swipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
        swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft | UISwipeGestureRecognizerDirectionRight;
        [_testView addGestureRecognizer:swipeGestureRecognizer];
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

- (void)swipe:(UISwipeGestureRecognizer *)gesture {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:@"Swipe gesture detected" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil]];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
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
