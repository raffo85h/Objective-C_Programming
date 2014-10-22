//
//  BNRPortfolio.h
//  Stocks
//
//  Created by Raffaele Rainone on 20/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BNRStockHolding;

@interface BNRPortfolio : NSObject

@property (nonatomic, copy) NSArray *holdings;
//@property (nonatomic, copy) NSArray *orderedPortfolio;
//@property (nonatomic, copy) NSArray *displayTop3;
- (NSArray *)holdingOrdered;
- (NSArray *)displayTop3;

- (float) currentValueOfPortfolio;
- (void) addStock:(BNRStockHolding *)stock;
- (void) removeStock:(BNRStockHolding *)stock;

@end
