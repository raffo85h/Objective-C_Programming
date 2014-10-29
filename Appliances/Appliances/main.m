//
//  main.m
//  Appliances
//
//  Created by Raffaele Rainone on 28/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRAppliance.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        BNRAppliance *a = [[BNRAppliance alloc] init];
        NSLog(@"a is %@",a);
        //now we change name and v
        [a setProductName:@"Whashing machine"];
        [a setVoltage:240];
        NSLog(@"a is %@",a);
    }
    return 0;
}
