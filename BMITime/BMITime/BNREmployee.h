//
//  BNREmployee.h
//  BMITime
//
//  Created by Raffaele Rainone on 18/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRPerson.h"

@interface BNREmployee : BNRPerson// this is a subclass of BNRPerson, together with the instance variables declared in Person we make something more:

@property (nonatomic) unsigned int employeeID;
@property (nonatomic) unsigned int officeAlarmCode;
@property (nonatomic) NSDate *hireDate;

- (double)yearsOfEmployment;//This is the instance method that is going to be defined in the .m file.

@end
