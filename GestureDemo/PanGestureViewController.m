//
//  PanGestureViewController.m
//  GestureDemo
//
//  Created by ShaoweiZhang on 18/2/2017.
//  Copyright © 2017 WSZ. All rights reserved.
//

#import "PanGestureViewController.h"

@interface PanGestureViewController ()
{
    UIView *_testView;
}

@end

@implementation PanGestureViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.navigationItem.title = @"Pan Gesture";
        self.edgesForExtendedLayout = UIRectEdgeNone;
        
        _testView = [[UIView alloc] init];
        _testView.backgroundColor = [UIColor orangeColor];
        
        UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        [_testView addGestureRecognizer:panGestureRecognizer];
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

- (void)pan:(UIPanGestureRecognizer *)gesture {
    CGPoint translationPoint = [gesture translationInView:self.view];
    _testView.center = CGPointMake(_testView.center.x + translationPoint.x, _testView.center.y + translationPoint.y);
    [gesture setTranslation:CGPointZero inView:self.view];
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
