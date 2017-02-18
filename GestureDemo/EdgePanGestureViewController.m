//
//  EdgePanGestureViewController.m
//  GestureDemo
//
//  Created by ShaoweiZhang on 18/2/2017.
//  Copyright © 2017 WSZ. All rights reserved.
//

#import "EdgePanGestureViewController.h"

@interface EdgePanGestureViewController ()
{
    UIView *_testView;
    CGRect _origFrame;
}
@end

@implementation EdgePanGestureViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.navigationItem.title = @"Edge Pan Gesture";
        self.edgesForExtendedLayout = UIRectEdgeNone;
        
        _testView = [[UIView alloc] init];
        _testView.backgroundColor = [UIColor orangeColor];
        
        UIScreenEdgePanGestureRecognizer *edgePanGestureRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(edgePan:)];
        edgePanGestureRecognizer.edges = UIRectEdgeRight;
        [self.view addGestureRecognizer:edgePanGestureRecognizer];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _testView.frame = CGRectMake(50, 50, 150, 150);
    _origFrame = _testView.frame;
    
    [self.view addSubview:_testView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)edgePan:(UIScreenEdgePanGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateChanged) {
        CGPoint translatePoint = [gesture translationInView:self.view];
        _testView.center = CGPointMake(_testView.center.x + translatePoint.x, _testView.center.y);
        [gesture setTranslation:CGPointZero inView:self.view];
    } else if (gesture.state == UIGestureRecognizerStateEnded) {
        _testView.frame = _origFrame;
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
