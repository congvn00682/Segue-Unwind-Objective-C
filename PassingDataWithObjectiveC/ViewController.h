//
//  ViewController.h
//  PassingDataWithObjectiveC
//
//  Created by Vu Ngoc Cong on 6/25/18.
//  Copyright © 2018 Vu Ngoc Cong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property NSString *name;
@property (weak, nonatomic) IBOutlet UITextField *nametextField;

@end

