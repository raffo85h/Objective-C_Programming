//
//  main.m
//  BMITime
//
//  Created by Raffaele Rainone on 17/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "BNRPerson.h"
#import "BNREmployee.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //first we create an instance BNREmployee called mikey:
        BNREmployee *mikey = [[BNREmployee alloc] init];
        
        //now we give the value of the variables weight and height:
        [mikey setWeightInKilos:96];//these two are 'set methods', i.e. they define the corresponding values
        [mikey setHeightInMeters:1.8];//indeed in the implementation part of the definition of the class these are defined as (void)!
        //now we use the dot notation
        mikey.employeeID = 12;
        mikey.hireDate = [NSDate dateWithNaturalLanguageString:@"Aug 2nd,2010"];
        
        //now we define variables with the value of height and weight above, and we print something
        int weight = [mikey weightInKilos];//those two are 'get methods', i.e. they are methods that read the corresponding values
        float height = [mikey heightInMeters];//indeed in the implementation part of the definition of the class these are defined as (float/int)!
        NSLog(@"mikey is %.2f meters tall and %d kg.", height, weight);
        NSDate *date = mikey.hireDate;
        NSLog(@"%@ works since %@.", mikey, date);
        
        //now we compute the body mass index and we print it
        float bmi = [mikey bodyMassIndex];//or we can do mikey.bodyMassIndex
        float years = [mikey yearsOfEmployment];//or we can do mikey.yearsOfEmployment
        NSLog(@"The bmi of mikey is %.1f, and he has been working with us for %.2f years.", bmi, years);
    }
    return 0;
}