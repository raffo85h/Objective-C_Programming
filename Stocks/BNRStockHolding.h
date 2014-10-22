//
//  BNRStockHolding.h
//  Stocks
//
//  Created by Raffaele Rainone on 17/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRStockHolding : NSObject

@property (nonatomic) float purchaseSharePrice;//to be redunt one can write @property (nonatomic, readwrite) -- 'readwrite' is the default, the other option is 'readonly' (that does not create a set method). Similarly, we have atomic and nonatomic (the difference between these two regards the multithreading); since atomic is default we need to write nonatomic.
@property (nonatomic) float currentSharePrice;
@property (nonatomic) int numberOfShares;
@property (nonatomic) NSString *symbol;

//the two instance methods
-(float)costInDollars;
-(float)valueIndollars;

@end