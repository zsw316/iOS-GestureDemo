//
//  MenuTableViewController.m
//  GestureDemo
//
//  Created by ShaoweiZhang on 18/2/2017.
//  Copyright © 2017 WSZ. All rights reserved.
//

#import "MenuTableViewController.h"
#import "TapGestureViewController.h"
#import "PinchGestureViewController.h"
#import "PanGestureViewController.h"
#import "LongPressGestureViewController.h"
#import "EdgePanGestureViewController.h"
#import "SwipeGestureViewController.h"
#import "GesturePriorityViewController.h"
#import "GestureConditionViewController.h"
#import "RotationGestureViewController.h"


@interface MenuTableViewController ()

@end

@implementation MenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationItem.title = @"Gesture Demo";
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 7;
    }
    else {
        return 2;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"Recognizers";
    }
    else {
        return @"Advanced";
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    NSString *titleForCell;
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                titleForCell = @"Tap";
                break;
            case 1:
                titleForCell = @"Pinch";
                break;
            case 2:
                titleForCell = @"Pan";
                break;
            case 3:
                titleForCell = @"Edge Pan";
                break;
            case 4:
                titleForCell = @"Long Press";
                break;
            case 5:
                titleForCell = @"Swipe";
                break;
            case 6:
                titleForCell = @"Rotation";
                break;
            default:
                break;
        }
    }
    else {
        switch (indexPath.row) {
            case 0:
                titleForCell = @"Gesture Priority";
                break;
            case 1:
                titleForCell = @"Gesture Condition";
                break;
            default:
                break;
        }
    }
    
    cell.textLabel.text = titleForCell;
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIViewController *targetVC;
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                targetVC = [[TapGestureViewController alloc] init];
                break;
            case 1:
                targetVC = [[PinchGestureViewController alloc] init];
                break;
            case 2:
                targetVC = [[PanGestureViewController alloc] init];
                break;
            case 3:
                targetVC = [[EdgePanGestureViewController alloc] init];
                break;
            case 4:
                targetVC = [[LongPressGestureViewController alloc] init];
                break;
            case 5:
                targetVC = [[SwipeGestureViewController alloc] init];
                break;
            case 6:
                targetVC = [[RotationGestureViewController alloc] init];
                break;
            default:
                break;
        }
    }
    else {
        switch (indexPath.row) {
            case 0:
                targetVC = [[GesturePriorityViewController alloc] init];
                break;
            case 1:
                targetVC = [[GestureConditionViewController alloc] init];
                break;
            default:
                break;
        }
    }
    
    if (targetVC) {
        [self.navigationController pushViewController:targetVC animated:YES];
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
