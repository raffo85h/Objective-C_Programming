//
//  BNRForeignStockHolding.m
//  Stocks
//
//  Created by Raffaele Rainone on 20/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#import "BNRForeignStockHolding.h"

@implementation BNRForeignStockHolding
-(float)costInDollars
{
    float p = [self purchaseSharePrice];//this is in Euros
    int n = [self numberOfShares];
    return p*n*1.276;
}

-(float)valueIndollars
{
    float c = [self currentSharePrice];//this is in Euros
    int n = [self numberOfShares];
    return c*n*1.276;
}

@end
