//
//  main.m
//  Stocks
//
//  Created by Raffaele Rainone on 17/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRForeignStockHolding.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        BNRStockHolding *share1 = [[BNRStockHolding alloc] init];
        BNRStockHolding *share2 = [[BNRStockHolding alloc] init];
        BNRStockHolding *share3 = [[BNRStockHolding alloc] init];
        //The following is a share in the european market; i.e. a foreign stock holding
        BNRForeignStockHolding *fca =[[BNRForeignStockHolding alloc] init];
        
        //define the empty array
        NSMutableArray *myShares = [NSMutableArray array];
        
        //Set the shares:
        [share1 setPurchaseSharePrice:2.30];//Notice that setPurchaseShare is not defined by me in .h or .m. But, since I use the @option, it is automatically defined by the machine.
        [share1 setCurrentSharePrice:4.50];
        [share1 setNumberOfShares:40];
        [myShares addObject:share1];
        
        //second share
        //Now we use the neater dotted notation to SET the instance variables:
        share2.purchaseSharePrice = 12.19;
        share2.currentSharePrice = 10.56;
        share2.numberOfShares = 90;
        [myShares addObject:share2];
        
        //third share
        share3.purchaseSharePrice = 45.10;
        share3.currentSharePrice = 49.51;
        share3.numberOfShares = 210;
        [myShares addObject:share3];
        
        //The foreigh share:
        fca.purchaseSharePrice = 6.57;//in €
        fca.currentSharePrice = 7.25;//in €
        fca.numberOfShares = 550;
        [myShares addObject: fca];
        
        //now we print the objects:
        for (BNRStockHolding *item in myShares)
        {
            //In the NSLog below only for the first variable we use the get notation with []. For the others we use again the neater dotted notation.
            NSLog(@"I bought %d shares at the price %.2f. Therefore I spent %.2f. Now each share costs: %.2f. Therefore, now, the total value is %.2f.", [item numberOfShares], item.purchaseSharePrice, item.costInDollars, item.currentSharePrice, item.valueIndollars);
        }
        //Notice that THING.purchaseSharePrice can mean both a GET and a SET. In other words, it can mean both:
        //1. [THING setPurchaseSharePrice: xxx]; and ----- e.g. THING.purchaseSharePrice = 112.05
        //2. [THING purchaseSharePrice]. -------------- e.g. float thePriceOfThisShareWhenIBoughtIt = THING.purchaseSharePrice (here the THING.purchaseSharePrice has already been given a value!).
    }
    return 0;
}
