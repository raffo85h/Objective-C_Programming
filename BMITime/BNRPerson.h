//
//  BNRPerson.h
//  BMITime
//
//  Created by Raffaele Rainone on 17/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#import <Foundation/Foundation.h>

//This class is called BNRPerson.
//BNR stands for "Big Nerd Ranch".
@interface BNRPerson : NSObject
{
    //We declare two instance variables: [CONVENTION we have always _ before the name: _theVariableName]
    float _heightInMeters;
    int _weightInKilos;
}

//Now we declare that our class has the following methods to read and declare the instance variables:

- (float)heightInMeters;//[CONVENTION we have always the variable name without the _ : theVariableName]
- (void)setHeightInMeters:(float)h;//[CONVENTION we have always set+the variable name without the _ : setTheVariableName]
- (int)weightInKilos;
- (void)setWeightInKilos:(int)w;

//Then we declare a method that uses the instance variables to compute something new:
- (float)bodyMassIndex;

//The following is another method:
- (void)addYourselfToArray:(NSMutableArray *)theArray;
@end
