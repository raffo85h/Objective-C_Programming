//
//  main.m
//  Groceries
//
//  Created by Raffaele Rainone on 17/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //CHALLENGE chapter 17, challenge 1: make a groceries list and thn prin each item. EASY!!!!
        //First we create an empty list
        NSMutableArray *groceriesList = [NSMutableArray array];
        //Now we add items to the list:
        [groceriesList addObject: @"pizza (pepperoni or calabrese)"];
        [groceriesList addObject: @"potatoes, 4x"];
        [groceriesList addObject: @"cherry vine tomatoes, 500gr"];
        [groceriesList addObject: @"bread, 1kg"];
        [groceriesList addObject: @"milk, 2pints"];
        [groceriesList addObject: @"salted butter"];
        //Now we print each item:
        for (NSString *item in groceriesList){
            NSLog(@"You need to buy: %@", item);
        }
    }
    return 0;
}
