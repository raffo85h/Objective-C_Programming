//
//  main.m
//  BMITime
//
//  Created by Raffaele Rainone on 17/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //first we create an instance called mikey:
        BNRPerson *mikey = [[BNRPerson alloc] init];
        
        //now we give the value of the variables weight and height:
        [mikey setWeightInKilos:96];//these two are 'set methods', i.e. they define the corresponding values
        [mikey setHeightInMeters:1.8];//indeed in the implementation part of the definition of the class these are defined as (void)!
        
        //now we define variables with the value of height and weight above, and we print something
        int weight = [mikey weightInKilos];//those two are 'get methods', i.e. they are methods that read the corresponding values
        float height = [mikey heightInMeters];//indeed in the implementation part of the definition of the class these are defined as (float/int)!
        NSLog(@"mikey is %.2f meters tall and %d kg.", height, weight);
        
        //now we compute the body mass index and we print it
        float bmi = [mikey bodyMassIndex];
        NSLog(@"The bmi of mikey is %.1f", bmi);
    }
    return 0;
}
