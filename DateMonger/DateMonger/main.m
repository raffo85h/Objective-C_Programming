//
//  main.m
//  DateMonger
//
//  Created by Raffaele Rainone on 30/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDate+BNRDateConvenience.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDate *myDate = [NSDate raf_giveDay:19 giveMonth:10 giveYear:1985];
        NSLog(@"%@",myDate);
    }
    return 0;
}