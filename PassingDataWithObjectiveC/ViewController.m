//
//  ViewController.m
//  PassingDataWithObjectiveC
//
//  Created by Vu Ngoc Cong on 6/25/18.
//  Copyright © 2018 Vu Ngoc Cong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nametextField.text = self.name;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    self.name = self.nametextField.text;
}

@end
