//
//  TableViewController.h
//  Sqlite
//
//  Created by Student-002 on 30/11/16.
//  Copyright © 2016 Felix-its. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController

@property (nonatomic, retain) NSMutableArray *array,*roll,*emp;
@property (nonatomic, retain) NSString *temp;
@property int rollno,empphone;
@property (nonatomic, retain)NSString *empadd,*empname;

@end
