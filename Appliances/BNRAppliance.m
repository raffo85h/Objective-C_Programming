//
//  BNRAppliance.m
//  Appliances
//
//  Created by Raffaele Rainone on 28/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#import "BNRAppliance.h"

@implementation BNRAppliance

/*
//to change only init
- (instancetype) init//if we do not define an init method here when we create an instance of BNRAppliance in main, BNRAppliace will use the init of its superclass: NSObject: hence the value of the BNRAppliane variables are set to 0 (or nil). If we want the default to be different from 0 we have to define init:
{
    //first we call the init of NSObject
    init method self = [super init];
    
    if (self) {//if self != nil then do the following. There are two main reson for which this verification is important; however, it almost never occurs that self=nil after the initialization. (Check pg.304 in the book.)
        _voltage = 120;//set only voltage to 120. While productName will have the standard value of nil
    }
    return self;
}
*/
//to create a new init that change both: 1. voltage by default and productName as we choose.
//THE FOLLOWING IS THE DESIGNATED INIIALIZER (pg 309).
- (instancetype)initWithProductName:(NSString *)pn
{
    //again, first call init from the super-class
    self = [super init];
    //check if self is not nil
    if (self) {
        //we could do this:
        //_productName = [pn copy];
        //_voltage = 120;
        //or in an easier way:
        [self setProductName:pn];
        [self setVoltage:120];
    }
    return self;
}
//notice that the previous has to be used:
//BNRAppliance *example = [[BNRAppliance alloc]initWithProductName:@"Oven"].
//If we do:
//BNRAppliance *example = [[BNRAppliance alloc]init]. Then we have example.voltate = 0!!!!! and also example.nameProduct = nil.
//If we don't want this to happen, i.e. we want to use also the norma init (with voltage=120 and productBName something not nil) then:
- (instancetype)init
{
    return [self initWithProductName:@"Unknown"];
}

//the following is the method description:
- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %d volts>",self.productName, self.voltage];
}

@end