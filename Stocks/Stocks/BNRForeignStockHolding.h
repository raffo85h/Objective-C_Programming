//
//  BNRForeignStockHolding.h
//  Stocks
//
//  Created by Raffaele Rainone on 20/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRStockHolding.h"

@interface BNRForeignStockHolding : BNRStockHolding
@property (nonatomic) float conversionRate;

@end
