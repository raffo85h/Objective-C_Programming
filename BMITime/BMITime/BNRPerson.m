//
//  BNRPerson.m
//  BMITime
//
//  Created by Raffaele Rainone on 17/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#import "BNRPerson.h"

@implementation BNRPerson

- (float)heightInMeters
{
    return _heightInMeters;
}

- (void)setHeightInMeters:(float)h
{
    _heightInMeters = h;
}

- (int)weightInKilos
{
    return _weightInKilos;
}

- (void)setWeightInKilos:(int)w
{
    _weightInKilos = w;
}

- (float)bodyMassIndex
{
    /*
    return _weightInKilos/(_heightInMeters * _heightInMeters);//here we use the instance variables. It's always better not to do this. Hence the following lines of code.
    */
    float h = [self heightInMeters];
    int w = [self weightInKilos];
    return w/(h*h);
}

- (void)addYourselfToArray:(NSMutableArray *)theArray
{
    [theArray addObject: self];
}

@end
