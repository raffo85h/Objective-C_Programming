//
//  main.m
//  Stocks
//
//  Created by Raffaele Rainone on 17/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRForeignStockHolding.h"
#import "BNRPortfolio.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        BNRPortfolio *myPortfolio = [[BNRPortfolio alloc] init];

        //Set the shares:
        BNRStockHolding *stockShare1 = [[BNRStockHolding alloc] init];
        stockShare1.symbol = @"GOOG";
        [stockShare1 setPurchaseSharePrice:2.30];//Notice that setPurchaseShare is not defined by me in .h or .m. But, since I use the @option, it is automatically defined by the machine.
        [stockShare1 setCurrentSharePrice:4.50];
        [stockShare1 setNumberOfShares:40];
        [myPortfolio addStock: stockShare1];
        
        //second share
        //Now we use the neater dotted notation to SET the instance variables:
        BNRStockHolding *stockShare2 = [[BNRStockHolding alloc] init];
        stockShare2.symbol = @"AAPL";
        stockShare2.purchaseSharePrice = 12.19;
        stockShare2.currentSharePrice = 10.56;
        stockShare2.numberOfShares = 90;
        [myPortfolio addStock:stockShare2];
        
        //third share
        BNRStockHolding *stockShare3 = [[BNRStockHolding alloc] init];
        stockShare3.symbol = @"TWTR";
        stockShare3.purchaseSharePrice = 45.10;
        stockShare3.currentSharePrice = 49.51;
        stockShare3.numberOfShares = 210;
        [myPortfolio addStock: stockShare3];
        
        //another share
        BNRStockHolding *stockYahoo = [[BNRStockHolding alloc] init];
        stockYahoo.symbol = @"YHOO";
        stockYahoo.purchaseSharePrice = 41.93;
        stockYahoo.currentSharePrice = 42.01;
        stockYahoo.numberOfShares = 300;
        [myPortfolio addStock:stockYahoo];
        
        //The foreign share:
        BNRForeignStockHolding *stockFCA =[[BNRForeignStockHolding alloc] init];
        stockFCA.symbol = @"FCA";
        stockFCA.currency = @"€";
        stockFCA.purchaseSharePrice = 6.57;//in €
        stockFCA.currentSharePrice = 7.25;//in €
        stockFCA.numberOfShares = 550;
        stockFCA.conversionRate = 1.276;
        [myPortfolio addStock: stockFCA];
        
        //Another foreign share - Tod's Spa:
        BNRForeignStockHolding *stockTOD = [[BNRForeignStockHolding alloc] init];
        stockTOD.symbol = @"TOD";
        stockTOD.currency = @"€";
        stockTOD.purchaseSharePrice = 87.13;
        stockTOD.currentSharePrice = 72.7;
        stockTOD.numberOfShares = 150;
        stockTOD.conversionRate = 1.276;
        [myPortfolio addStock:stockTOD];
        
        //Another foreign share - Campari Group
        BNRForeignStockHolding *stockCampari = [[BNRForeignStockHolding alloc] init];
        stockCampari.symbol = @"CPR";
        stockCampari.currency = @"€";
        stockCampari.purchaseSharePrice = 7.13;
        stockCampari.currentSharePrice = 5.7;
        stockCampari.numberOfShares = 500;
        stockCampari.conversionRate = 1.276;
        [myPortfolio addStock:stockCampari];
        
        //now we print the objects:
        for (BNRStockHolding *item in myPortfolio.holdings)
        {
            NSLog(@"%@",item);
        }
        
        //The following line uses removeStock to remove the shares of TWITTER, i.e. stockShare3
        //[myPortfolio removeStock: stockShare3];
        
        //CHALLENGE.1. Chapter 24.
        //Add method to dispaly an array with only the TOP 3 stock holding that have maximum value. We shall call this method: 'displayTop3'. See BNRPortfolio.m
        //WE could use NSLog(@"%@",myPortfolio.displayTop3); but with the following 5 lines is cleaner.
        NSLog(@"\n\nNow we print the TOP 3.\n\n");

        for (BNRStockHolding *item in myPortfolio.displayTop3){
            NSLog(@"%@",item);
        }

        //CHALLENGE.2. Chapter 24.
        //now we print the objects ordered via their symbols:
        NSLog(@"\n\n NOW ORDERED\n\n");
        for (BNRStockHolding *item in myPortfolio.holdingOrdered)
        {
            NSLog(@"%@",item);
        }
    }
    return 0;
}