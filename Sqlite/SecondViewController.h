//
//  SecondViewController.h
//  Sqlite
//
//  Created by Student-002 on 30/11/16.
//  Copyright © 2016 Felix-its. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *empid;
@property (strong, nonatomic) IBOutlet UITextField *empname;
@property (strong, nonatomic) IBOutlet UITextField *empadd;

@property (strong, nonatomic) IBOutlet UITextField *empphone;

@property (strong, nonatomic) IBOutlet UIButton *update;

- (IBAction)delete:(id)sender;

@end
