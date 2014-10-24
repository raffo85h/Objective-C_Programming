//
//  main.m
//  VowelMovement
//
//  Created by Raffaele Rainone on 24/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ArrayEnumerationBlock)(id, NSUInteger,BOOL *);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //create array of strings:
        NSArray *originalStrings = @[@"Sauerkraut",@"Raygun",@"Big Nerd Ranch",@"Mississippi"];
        NSLog(@"The original strings are: %@",originalStrings);
        //the following is the array where we copy the original strings and then we devowelise them
        NSMutableArray *devowelizedStrings = [NSMutableArray array];
        //we create the list of vowels
        NSArray *vowels = @[@"a",@"e",@"i",@"o",@"u"];

        //A block can be memorized in a variable:
        ArrayEnumerationBlock devowelizer;

        //Now we create the block:
        devowelizer = ^(id string, NSUInteger i, BOOL *stop){
            //if there is a word with a y/Y then we stop
            NSRange yRange = [string rangeOfString:@"y" options:NSCaseInsensitiveSearch];
            //if there is a y in string then stop the block
            if (yRange.location != NSNotFound) {
                *stop = YES;
                return;
            }
            
            
            NSMutableString *newString = [NSMutableString stringWithString:string];
            //now we iterazte on the array of vowels:
            for (NSString *s in vowels) {
                NSRange fullRange = NSMakeRange(0, [newString length]);
                [newString replaceOccurrencesOfString:s
                                           withString:@""
                                              options:NSCaseInsensitiveSearch
                                                range:fullRange];
            }
            [devowelizedStrings addObject:newString];
        };//The block terminates here.

        //now we iterate on the array originalStrings using the block:
        [originalStrings enumerateObjectsUsingBlock:devowelizer];
        NSLog(@"The devowelized stringa are: %@",devowelizedStrings);
    }
    return 0;
}
