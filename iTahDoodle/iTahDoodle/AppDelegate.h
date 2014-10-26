//
//  AppDelegate.h
//  iTahDoodle
//
//  Created by Raffaele Rainone on 25/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#import <UIKit/UIKit.h>

//we declare an auxiliar function that we shall use to get the path to the position where we can save the list as xmw file
NSString *BNRDocPath(void);//since this has been declared before the @interface, it does not belong to the BNRAppDelegate class!
                //In fact we could create .h and .m just for this function. However, in this case there is only 1 aux funct, hence we don't do that.

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITableViewDataSource>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic) UITableView *taskTable;
@property (nonatomic) UITextField *taskField;
@property (nonatomic) UIButton *insertButton;
//@property (nonatomic) UIButton *deleteButton;//MINE

@property (nonatomic) NSMutableArray *tasks;

- (void)addTask:(id) sender;
//- (void)removeTask:(id) sender;//MINE

@end