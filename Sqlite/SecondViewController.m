//
//  SecondViewController.m
//  Sqlite
//
//  Created by Student-002 on 30/11/16.
//  Copyright © 2016 Felix-its. All rights reserved.
//

#import "SecondViewController.h"
#import <sqlite3.h>
#import "TableViewController.h"
#import "ViewController.h"
#import "Employee.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)update:(id)sender {
    NSArray *dircontents= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //function will return contents of document dir
    NSString *dbpath=[NSString stringWithFormat:@"%@/EmpDetails.splite",[dircontents lastObject]];
    NSLog(@"%@",dbpath);
    //create  database folder of name EmpDetails.splite It is check if it already present then it doesnot create
    sqlite3 *db;

    if(  sqlite3_open([dbpath UTF8String], &db)  ==  SQLITE_OK)
    {
        
        //Step 4: Create Table   (Empid int,Empname varchar(20),Empaddr varchar(20),Empmob int)";
//        const char *query="create table employee(empid integer, empname varchar(20),empaddress varchar(20),empphoneno integer)";
        
        NSString *q = [[NSString alloc] initWithFormat:@"update employee set empname = '%@', empaddress = '%@' , empphoneno = '%@' where empid = '%@'",_empname.text,_empadd.text,_empphone.text,_empid.text];
        const char * query = [q UTF8String];
        
        if( sqlite3_exec(db, query, NULL, NULL, NULL) == SQLITE_OK)
        {
            NSLog(@"Record updated");
            [self.navigationController popViewControllerAnimated:YES];
        }
        else
        {
            NSLog(@"Failed to update the record");
        }
        sqlite3_close(db);
    }
    else
    {
        NSLog(@"Unable to open database while updating records");
    }
}
- (IBAction)delete:(id)sender {
    
    NSArray *dircontents= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //function will return contents of document dir
    NSString *dbpath=[NSString stringWithFormat:@"%@/EmpDetails.splite",[dircontents lastObject]];
    NSLog(@"%@",dbpath);
    //create  database folder of name EmpDetails.splite It is check if it already present then it doesnot create
    sqlite3 *db;
    //Step 4: Create Table
    if(  sqlite3_open([dbpath UTF8String], &db)  ==  SQLITE_OK)
    {
    NSString *q = [[NSString alloc] initWithFormat:@"delete from employee where empid = '%@'",_empid.text];
    const char * query = [q UTF8String];
    
    if( sqlite3_exec(db, query, NULL, NULL, NULL) == SQLITE_OK)
    {
        NSLog(@"Record deleted");
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        NSLog(@"Failed to delete the record");
    }
    sqlite3_close(db);
}
else
{
    NSLog(@"Unable to open database while deleting records");
}
}

@end
