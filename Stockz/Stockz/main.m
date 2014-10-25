//
//  main.m
//  Stockz
//
//  Created by Raffaele Rainone on 25/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //the following array will comprise the details of the share that I possess
        NSMutableArray *stocks = [[NSMutableArray alloc] init];
        
        //we create a dictionary with the details of the first share
        NSMutableDictionary *stock;//it is convenient to split lines because 'stock' will be used for all the dictionaries!
        stock = [NSMutableDictionary dictionary];
        [stock setObject:@"AAPL" forKey:@"symbol"];
        [stock setObject:[NSNumber numberWithInt:200] forKey:@"shares"];
        [stock setObject:[NSNumber numberWithBool:YES] forKey:@"whish to sell"];
        [stock setObject:[NSDate dateWithNaturalLanguageString:@"19/Oct/2014"] forKey:@"date bought"];
        [stocks addObject:stock];//add this dictionary to the array
        
        //the second..
        stock = [NSMutableDictionary dictionary];
        [stock setObject:@"GOOG" forKey:@"symbol"];
        [stock setObject:[NSNumber numberWithInt:160] forKey:@"shares"];
        [stock setObject:[NSNumber numberWithBool:NO] forKey:@"whish to sell"];
        [stock setObject:[NSDate dateWithNaturalLanguageString:@"1/Aug/2014"] forKey:@"date bought"];
        [stocks addObject:stock];//add this dictionary to the array
        
        //now we create a .plist file (that is written ad XML code) with the information of the array
        NSString *nameOfFile = @"/tmp/stocks.plist";
        [stocks writeToFile:nameOfFile atomically:YES];
        
        //notice that Xcode can read these type of files (not only the one that it create - I suppose). Now we take the information from the XML code and we put these info in the new array:
        NSArray *stockList = [NSArray arrayWithContentsOfFile:nameOfFile];
        
        //finally we print what we want:
        for (NSDictionary *d in stockList){
            NSLog(@"I bought %@ shares of %@ on %@. I have already decided whether I'll sell these or not, the answer is: %@",[d objectForKey:@"shares"],[d objectForKey:@"symbol"],[d objectForKey:@"date bought"],[d objectForKey:@"whish to sell"]);
        }
    }
    return 0;
}
