//
//  ViewController.m
//  Sqlite
//
//  Created by Student-002 on 30/11/16.
//  Copyright © 2016 Felix-its. All rights reserved.
//

#import "ViewController.h"
#import <sqlite3.h>
#import "TableViewController.h"
#import "SecondViewController.h"
#import "Employee.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender {
    
    NSArray *dircontents= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //function will return contents of document dir
    NSString *dbpath=[NSString stringWithFormat:@"%@/EmpDetails.splite",[dircontents lastObject]];
    NSLog(@"%@",dbpath);
    //create  database folder of name EmpDetails.splite It is check if it already present then it doesnot create
    sqlite3 *db;
    
    if(sqlite3_open([dbpath UTF8String], &db)==SQLITE_OK)
    {
        NSString *query=[NSString stringWithFormat:@"insert into employee values (\'%@\', \'%@\', \'%@\', \'%@\')",_empid.text,_empname.text,_empadd.text,_empphone.text];
        
        
        if(sqlite3_exec(db, [query UTF8String], NULL, NULL, NULL)==SQLITE_OK)
        {
            NSLog(@"Record inserted");
        }
        else
        {
            NSLog(@"fail to insert record");
        }
        
    }
    else
    {
        NSLog(@"Fail to open");
    }
    sqlite3_close(db);
}
@end
