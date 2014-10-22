//
//  BNREmployee.h
//  BMITime
//
//  Created by Raffaele Rainone on 18/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRPerson.h"
@class BNRAsset;

@interface BNREmployee : BNRPerson// this is a subclass of BNRPerson, together with the instance variables declared in Person we make something more:

@property (nonatomic) unsigned int employeeID;
@property (nonatomic) NSDate *hireDate;
@property (nonatomic, copy) NSSet *assets;//add in chapter 21

- (double)yearsOfEmployment;//This is the instance method that is going to be defined in the .m file.
//add in chapter 21
-(void) addAssets: (BNRAsset *)a;
-(void) removeAssets: (BNRAsset *)a;//CHALLENGE, chapter 21
-(unsigned int) valueOfAssets;

@end