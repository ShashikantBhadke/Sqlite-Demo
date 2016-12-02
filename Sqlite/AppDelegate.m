//
//  AppDelegate.m
//  Sqlite
//
//  Created by Student-002 on 30/11/16.
//  Copyright © 2016 Felix-its. All rights reserved.
//

#import "AppDelegate.h"
#import <sqlite3.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self createdatabase];
    return YES;
}
-(void)createdatabase
{
    NSArray *dircontents= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //function will return contents of document dir
    NSString *dbpath=[NSString stringWithFormat:@"%@/EmpDetails.splite",[dircontents lastObject]];
    //create  database folder of name EmpDetails.splite It is check if it already present then it doesnot create
    NSLog(@"%@",dbpath);
    
    NSFileManager *f=[[NSFileManager alloc]init];
    if([f fileExistsAtPath:dbpath])
    {
        NSLog(@"Database already present");
        return;
        //return must required here to check already exist or not if s then do not create
    }
    sqlite3 * db;
    //create structure pointer here and sqlite is structure not object
    
    if(sqlite3_open([dbpath UTF8String], &db)==SQLITE_OK)
    {
        
        //[dbpath UTF8String] need char like in c lan so convert it into that and check resoponce is ok or not
        const char *query="create table employee(empid integer, empname varchar(20),empaddress varchar(20),empphoneno integer)";
        
        
        //create database of table contain
        
        if(sqlite3_exec(db, query, NULL, NULL, NULL)==SQLITE_OK)
        {
            NSLog(@"table created");
        }
        else
        {
            NSLog(@"fail to create table");
        }
    }
    else
    {
        NSLog(@"fail to open database");
    }
    sqlite3_close(db);
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
