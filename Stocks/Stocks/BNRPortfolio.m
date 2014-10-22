//
//  BNRPortfolio.m
//  Stocks
//
//  Created by Raffaele Rainone on 20/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#import "BNRStockHolding.h"
#import "BNRForeignStockHolding.h"
#import "BNRPortfolio.h"

@interface BNRPortfolio ()
{
    NSMutableArray *_holdings;
    NSMutableArray *_holdingOrdered;//challenge2
    NSMutableArray *_displayTop3;//challenge1
}
@end

@implementation BNRPortfolio

-(void) setHoldings:(NSArray *)h
{
    _holdings = [h mutableCopy];
}

- (NSArray *)holdings
{
    return [_holdings copy];
}

- (NSArray *)holdingOrdered
{
    _holdingOrdered = [self.holdings mutableCopy];
    NSSortDescriptor *smb = [NSSortDescriptor sortDescriptorWithKey:@"symbol" ascending:YES];
    [_holdingOrdered sortUsingDescriptors:@[smb]];
    return [_holdingOrdered copy];
}

- (NSArray *) displayTop3
{
    //We order the array _holdings:
    NSSortDescriptor *vid = [NSSortDescriptor sortDescriptorWithKey:@"valueIndollars"
                                                          ascending:NO];//vid means value in dollars
    [_holdings sortUsingDescriptors: @[vid]];
    //we have to return the elements 0,1,2 of _holdings. So we copy these items in a new array called top3. First we create it (if _holdings contains more than 3 elements!):
    if (_holdings.count>3){
        NSMutableArray *top3 = [[NSMutableArray alloc] init];
        for (int i=0; i<3; i++) {
            [top3 insertObject:[_holdings objectAtIndex:i] atIndex:i];
        }
        return [top3 copy];
    } else{
        return [_holdings copy];
    }
}

- (float) currentValueOfPortfolio
{
    float total = 0;
    for (BNRStockHolding *stock in self.holdings)
    {
        total += stock.valueIndollars;
    }
    return total;
}

- (void) addStock:(BNRStockHolding *)s
{
    if (!_holdings)//if holdings = nil the you must create it. Then you add the object.
    {
        _holdings = [[NSMutableArray alloc] init];
    }
    [_holdings addObject: s];
}

- (void) removeStock:(BNRStockHolding *)s
{
    if (!_holdings)
    {
        return NSLog(@"ERROR.");
    } else {
        [_holdings removeObject: s];
    }
}
@end