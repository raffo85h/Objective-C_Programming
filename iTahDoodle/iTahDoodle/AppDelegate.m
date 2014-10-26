//
//  AppDelegate.m
//  iTahDoodle
//
//  Created by Raffaele Rainone on 25/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#import "AppDelegate.h"

//the aux funct:
NSString *BNRDocPath()
{
    NSArray *pathList = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [pathList[0] stringByAppendingPathComponent:@"data.td"];
}

@interface AppDelegate ()
@end

@implementation AppDelegate

#pragma mark - Application delegate callbacks

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {//----Qui si inserisce tutto cio' che occorre fare prima che l'utente interagisca con l'applicazione.----
    //Get an existent DATASET or create a new one. We use BNRDocPath
    NSArray *plist = [NSArray arrayWithContentsOfFile:BNRDocPath()];
    if (plist){//if the dataset already exists
        self.tasks = [plist mutableCopy];
    } else{//we create it
        self.tasks = [NSMutableArray array];
    }

    /*Plan: 1.create each object. 2.confiure each object setting its features. 3.add these objects as sub-view of the object window. 4. allocate the window on the screen.*/
    // Override point for customization after application launch.
    
    //**********************UIWINDOW**********************
    //Create and configurate the instance of UIWindow
    // CGrect is a 'struct' with an origin (x,y) and dimensions (width,height)
    CGRect winFrame = [[UIScreen mainScreen] bounds];
    UIWindow *theWindow = [[UIWindow alloc] initWithFrame:winFrame];
    self.window = theWindow;
    
    //now we define the rectangular frames of 3 elements  in the UI
    //CGRecMake() creates a CGRec with (x,y,width,height)
    CGRect tableFrame = CGRectMake(0, 80, winFrame.size.width, winFrame.size.height-100);//the main table
    CGRect fieldFrame = CGRectMake(20, 40, 200, 31);
    CGRect buttonFrame = CGRectMake(228, 40, 72, 31);
//MINE: tried to add a remove buttom.
/*    CGRect fieldFrame = CGRectMake(10, 40, 192, 31);
    CGRect buttonFrame = CGRectMake(210, 40, 60, 31);
    CGRect deleteFrame = CGRectMake(280, 40, 31, 31);*/

    //**********************UITABLEVIEW**********************
    self.taskTable = [[UITableView alloc] initWithFrame:tableFrame
                                                  style:UITableViewStylePlain];
    self.taskTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //set AppDelegat as dataSource of the table view
    self.taskTable.dataSource = self;
    
    //the following indicates to the table-view which class to make any time it needs to create a new cell in the table
    [self.taskTable registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"Cell"];
    
    //**********************UITEXTFIELD**********************
    self.taskField = [[UITextField alloc] initWithFrame:fieldFrame];
    self.taskField.borderStyle = UITextBorderStyleRoundedRect;
    self.taskField.placeholder = @"Type a task, tap insert";//this is the message that appear in the box in light color (grey-ish)
    
    //**********************UIBUTTON**********************
    self.insertButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.insertButton.frame = buttonFrame;
    [self.insertButton setTitle:@"Insert" forState:UIControlStateNormal];//give a title to the button
    //the following give a function to the button (it works with a target-action pullback).
    [self.insertButton addTarget:self
                          action:@selector(addTask:)
                forControlEvents:UIControlEventTouchUpInside];

    //**********************MINE UIBUTTON**********************
/*    self.deleteButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.deleteButton.frame = deleteFrame;
    [self.deleteButton setTitle:@"X" forState:UIControlStateNormal];//give a title to the button
    //the following give a function to the button (it works with a target-action pullback).
    [self.deleteButton addTarget:self
                          action:@selector(removeTask:)
                forControlEvents:UIControlEventTouchUpInside];
*/
    //NOW we add these 3 items to the window interface
    [self.window addSubview:self.taskTable];
    [self.window addSubview:self.taskField];
    [self.window addSubview:self.insertButton];
//    [self.window addSubview:self.deleteButton];
    
    //Finalise the window and put it on the screen
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    //**********
    //Here we add some code that uses BNRDocPath() defined above (this save the list of activities when the user end the application)
    [self.tasks writeToFile:BNRDocPath() atomically:YES];
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

#pragma mark - Actions

-(void)addTask:(id)sender
{
    //get the text from task.field
    NSString *text = [self.taskField text];
    
    //If the text is empty then we are done...we do not add anything
    if ([text length] == 0){
        return;
    }
    //if there is text then we print it into the console
    //NSLog(@"You inserted: %@",text);//WE DON'T NEED THIS. We need to add this at the array:
    //Add to the array
    [self.tasks addObject:text];
    //Now update the table so it displays the new element:
    [self.taskTable reloadData];
    
    //now we delete the taskField
    [self.taskField setText:@""];
    
    //close the keyboard
    [self.taskField resignFirstResponder];
}
/*
//The following defined the method to remove an element. BUT IT DOES NOT WORK :(
// CHECK THIS AGAIN, in order to remove a row we use deleteRowsAtIndexPaths from self.taskTable.
// There must be a method to detect the Selected Row! CHECK!!!!!!
- (void)removeTask:(id)sender
{   //if there is nothing then do nothing
    if (self.tasks.count == 0){
        return;
    }
    //if there is something then we store which row is selected
    NSIndexPath *rowsToRemove = [self.taskTable indexPathForSelectedRow];
    //if nothing is selected then we do nothing
    if (rowsToRemove.length == 0) {
        return;
    }
    NSLog(@"%@",rowsToRemove);
    NSArray *rowsToRemoveArray = [[NSArray alloc] initWithObjects:rowsToRemove, nil];
    //otherwise we delete that row
    [self.taskTable deleteRowsAtIndexPaths:rowsToRemoveArray withRowAnimation:UITableViewRowAnimationFade];
    //Now update the table:
    [self.taskTable reloadData];
}
*/

#pragma mark - Table view management

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //Our table has only one section. Therefore the number of rows = number of elements of the array of activities
    return [self.tasks count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //First we check if there exists a cell object that we can re-use. If not, we create a new cell
    UITableViewCell *c = [self.taskTable dequeueReusableCellWithIdentifier:@"Cell"];
    //Now we configure the cell depending on the array of activities (the model)
    NSString *item = [self.tasks objectAtIndex:indexPath.row];
    c.textLabel.text = item;
    //so we assign the cell to the table
    return c;
}

@end
