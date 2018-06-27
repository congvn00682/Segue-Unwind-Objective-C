//
//  MasterTableViewController.m
//  PassingDataWithObjectiveC
//
//  Created by Vu Ngoc Cong on 6/25/18.
//  Copyright © 2018 Vu Ngoc Cong. All rights reserved.
//

#import "MasterTableViewController.h"
#import "ViewController.h"

@interface MasterTableViewController ()

@property NSMutableArray *nameStudents;

@end

@implementation MasterTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    if (!self.nameStudents) {
        self.nameStudents = [[NSMutableArray alloc] init];
    }
//    [self.nameStudents addObject:@"Hoá"];
    [self.nameStudents insertObject:@"Cong" atIndex:0];
    [self.nameStudents insertObject:@"Chung" atIndex:1];
    [self.nameStudents insertObject:@"Dung" atIndex:2];
    [self.nameStudents insertObject:@"Luyen" atIndex:3];
    [self.nameStudents insertObject:@"Hien" atIndex:4];
    [self.nameStudents insertObject:@"Tuyen" atIndex:5];
    [self.nameStudents insertObject:@"Anh" atIndex:6];
    [self.nameStudents insertObject:@"Phuong" atIndex:7];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.nameStudents.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.nameStudents[indexPath.row];
    
    return cell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ViewController *vc;
    NSIndexPath *indexPath;
    if ((vc = [segue destinationViewController])) {
        if ((indexPath = [self.tableView indexPathForSelectedRow])) {
            vc.name = self.nameStudents[indexPath.row];
            
        }
    }
}


- (IBAction)unwind:(UIStoryboardSegue*)sender {
    ViewController *vc;
    NSIndexPath *indexPath;
    if ((vc = [sender sourceViewController])) {
        if ((indexPath = [self.tableView indexPathForSelectedRow])) {
            self.nameStudents[indexPath.row] = vc.name;
        }
        else {
            [self.nameStudents insertObject:vc.name atIndex:self.nameStudents.count];
        }
    }
    
    [self.tableView reloadData];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.nameStudents removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    [self.tableView reloadData];
}

@end
