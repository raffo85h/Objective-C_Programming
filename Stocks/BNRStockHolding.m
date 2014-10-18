//
//  BNRStockHolding.m
//  Stocks
//
//  Created by Raffaele Rainone on 17/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#import "BNRStockHolding.h"

@implementation BNRStockHolding
/*
 //Thanks to the property declaration we can avoid the following:
-(float)purchaseSharePrice
{
    return _purchaseSharePrice;
}

-(void)setPurchaseSharePrice:(float)p
{
    _purchaseSharePrice = p;
}

-(float)currentSharePrice
{
    return _currentSharePrice;
}

-(void)setCurrentSharePrice:(float)c
{
    _currentSharePrice = c;
}

-(int)numberOfShares
{
    return _numberOfShares;
}

-(void)setNumberOfShares:(int)n
{
    _numberOfShares = n;
}
*/
-(float)costInDollars
{
    float p = [self purchaseSharePrice];
    int n = [self numberOfShares];
    return p*n;
}

-(float)valueIndollars
{
    float c = [self currentSharePrice];
    int n = [self numberOfShares];
    return c*n;
}

-(void)addToArray:(NSMutableArray *)theArray
{
    [theArray addObject: self];
}

@end
