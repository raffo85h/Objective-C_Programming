//
//  BNRStockHolding.m
//  Stocks
//
//  Created by Raffaele Rainone on 17/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#import "BNRStockHolding.h"

@implementation BNRStockHolding

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

- (NSString *) description
{
    return [NSString stringWithFormat:@"\n Company Symbol: %@.\n Number of Shares: %d.\n Purchase share price in USD: %.2f.\n Cost in USD: %.2f.\n Current share pice in USD: %.2f.\n Current value in USD: %.2f.", self.symbol, self.numberOfShares, self.purchaseSharePrice, self.costInDollars, self.currentSharePrice, self.valueIndollars];
}
@end
