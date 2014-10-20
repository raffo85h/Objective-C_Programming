//
//  BNREmployee.m
//  BMITime
//
//  Created by Raffaele Rainone on 18/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#import "BNREmployee.h"

@implementation BNREmployee

- (double)yearsOfEmployment//Clearly, this will be the number of years passed from hireDate to now. Therefore this depends on whether or nor hireDate is 'nil'.
{
    if (self.hireDate)
    {
        NSDate *now = [NSDate date];
        NSTimeInterval secs = [now timeIntervalSinceDate: self.hireDate];
        return secs/(3600*24*365+3600*6);//in an year there are 365days and 6hours. Each hourse comprise of 3600secs.
    } else{//if hireDate = nil; then the guy is not an employee. In particular the numer of years employed is 0.
        return 0;
    }
}

//let's change the BMI calculation with respect to the super-class
- (float)bodyMassIndex
{
    //we know that all the employee have BMI = 16.0, so it's better to define it rather than make the machine to compute it
    //return 19.0;
    //If instead we want the new BMI to be the old BMI -its 10% then we compute the original BMI, it is in the super-class so we do:
    float standardBMI = [super bodyMassIndex];
    return standardBMI*0.9;
}

- (NSString *)description
{
    return [NSString stringWithFormat: @"<Employee %d>", self.employeeID];
}

@end
