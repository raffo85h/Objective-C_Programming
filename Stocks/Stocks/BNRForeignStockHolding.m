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
    return p*n*self.conversionRate;
}

-(float)valueIndollars
{
    float c = [self currentSharePrice];//this is in Euros
    int n = [self numberOfShares];
    return c*n*self.conversionRate;
}

- (NSString *) description
{
    return [NSString stringWithFormat:@"\n Company Symbol: %@.\n Number of Shares: %d.\n Purchase share price in %@: %.2f.\n Cost in USD: %.2f.\n Current share price in %@: %.2f.\n Current value in USD: %.2f.", self.symbol, self.numberOfShares, self.currency, self.purchaseSharePrice, self.costInDollars, self.currency, self.currentSharePrice, self.valueIndollars];
}

@end
