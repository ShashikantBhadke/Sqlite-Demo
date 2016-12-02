//
//  TableViewController.m
//  Sqlite
//
//  Created by Student-002 on 30/11/16.
//  Copyright © 2016 Felix-its. All rights reserved.
//

#import "TableViewController.h"
#import <sqlite3.h>
#import "ViewController.h"
#import "SecondViewController.h"
@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
        [super viewDidLoad];
    
        
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}
-(void)viewWillAppear:(BOOL)animated
{
    _array=[[NSMutableArray alloc]init];
    _roll=[[NSMutableArray alloc]init];
    
    //Read database
    
    NSArray *dircontents= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //function will return contents of document dir
    NSString *dbpath=[NSString stringWithFormat:@"%@/EmpDetails.splite",[dircontents lastObject]];
    //create  database folder of name EmpDetails.splite It is check if it already present then it doesnot create
    sqlite3 *db;
    
    sqlite3_stmt *mystmt;
    
    if(sqlite3_open([dbpath UTF8String], &db)==SQLITE_OK)
    {
        const char *query="select * from employee";
        
        if(sqlite3_prepare(db, query, -1, &mystmt, NULL)==SQLITE_OK)
        {
            while(sqlite3_step(mystmt)==SQLITE_ROW)
            {
                
                int t1= sqlite3_column_int(mystmt, 0);
                
                NSString *t2=[NSString stringWithFormat:@"%s",sqlite3_column_text    (mystmt, 1)];
//                [_roll addObject:[NSNumber numberWithInt:t1]];
                [_array addObject:t2];
                NSString *t3=[NSString stringWithFormat:@"%s",sqlite3_column_text(mystmt, 2)];
                int t4= sqlite3_column_int(mystmt, 3);
                
                NSLog(@"%d  %@  %@   %d",t1,t2,t3,t4);
            }
        }
        
        
    }
    else
    {
        NSLog(@"fail to open");
    }
    sqlite3_close(db);
    
    
    
    // Navigation Control
    self.navigationItem.title=@"1VC";
        [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return _array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
//    cell.textLabel.text=[_roll objectAtIndex:indexPath.row];
    cell.textLabel.text=[_array objectAtIndex:indexPath.row];
    // Configure the cell...
    
    return cell;
}
//Navigation control svc

//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if([[segue identifier] isEqualToString:@"fvctosvc"])
//    {
//
//        SecondViewController *svc=[segue destinationViewController];
//        
//    }
//}
//

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"fvctosvc" sender:self];
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
