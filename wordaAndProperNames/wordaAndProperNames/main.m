//
//  main.m
//  wordaAndProperNames
//
//  Created by Raffaele Rainone on 17/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //CHALLENGE chapter 17, challenge 2.
        //look at the two files:
        // 1. /usr/share/dict/propernames
        // 2. /usr/share/dict/words
        //find a proper name that is also a word and print it out.
        
        //First of all we read the files as a string (and we ignore errors):
        NSString *wordsString = [NSString stringWithContentsOfFile:@"/usr/share/dict/words" encoding: NSUTF8StringEncoding error: NULL];
        NSString *properNamesString = [NSString stringWithContentsOfFile:@"/usr/share/dict/properNames" encoding: NSUTF8StringEncoding error: NULL];
        //if in the file words we have "lemma\ntheorem" then it is recorded as it is in wordsString. So we have to make an array
        // where each word is a different item. To do this we use componentSeparatedByString: XXX
        
        NSArray *words = [wordsString componentsSeparatedByString:@"\n"];
        NSArray *properNames = [properNamesString componentsSeparatedByString:@"\n"];
        
        //Now, for each element in properNames we check if it is in words, in the affermative case we print it.
        /* 
        //According to the following 9 lines (that are) commented out, we have that 'propernames' is a subset of 'words'
        //However, we have that Aaron is a proper name and allso a word, but aaron is not a word.
        //So we check this in the not-commented out code below.
        int i=0;
        for (NSString *name in properNames)
        {
            if ([words containsObject: name])
            {
                NSLog(@"%@", name);
                i += 1;
            }
        }
        if (i == [properNames count]){
            NSLog(@"Each name is in the file words. And there are %lu proper names", [properNames count]);
        }
        */
        for (NSString *name in properNames)
        {
            if ([words containsObject: [name lowercaseString]])//According to the Documentation, 'containsObject' check if the object is in the array by looking at each element of the array.
                //instead of containsObject one should create a 'binary search' function - since both files are alphabetically ordered.
            {
                NSLog(@"%@", name);
            }
        }
    }
    return 0;
}
