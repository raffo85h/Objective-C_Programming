//
//  main.m
//  LearnNSString
//
//  Created by Raffaele Rainone on 14/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <readline/readline.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //create an instance of string and print it
        NSString *lament = @"Perche' a me?!";
        NSLog(@"%@",lament);
        
        //create another instance of string with a unicode character
        NSString *slogan = @"I \u2661 ITALY";
        NSLog(@"%@",slogan);
        
        //create an instace of a string that is dynamic (contains the date and time)
        NSDate *now = [NSDate date];
        NSString *dateString = [NSString stringWithFormat:@"Data e ora: %@", now];
        NSLog(@"%@",dateString);
        
        //let's see examples of NSString methods.
        //1. Length of a string, this is an instance method:
        NSUInteger length1 = [lament length];
        NSLog(@"the length of the string \"%@\" is %lu.\n\n", lament, length1);
        
        //To check wheter two strings are the same we use
        BOOL check1 = [slogan isEqualToString: lament];
        if (check1){
            NSLog(@"They are equal.");
        } else {
            NSLog(@"They are not equal.");
        }
        
        //To upper a string: [string uppercaseString]
        NSLog(@"the length of the string \"%@\" is %lu.\n\n", [lament uppercaseString], length1);
        
        //The method that check the character of a string in a given position is
        NSLog(@"The 4th character of the string \"%@\" is %c. The 9th is %c.\n\n", lament, [lament characterAtIndex: 3],[lament characterAtIndex: 8]);
        
        //To find if a given word appears in a string we use the class method rangeOfString that returns an NSRange pair (location, length). So
        NSString *listOfNames = @"Gigi, Zappino, Chianghiero, Pako, Raffo, Toto, Pierpo, Ricky";
        NSString *nameWeLookFor1 = @"raffo";//not found because this is 'raffo' and not 'Raffo'.
        NSString *nameWeLookFor2 = @"Raffo";
        NSRange match1 = [listOfNames rangeOfString: nameWeLookFor1];
        NSRange match2 = [listOfNames rangeOfString: nameWeLookFor2];
        if (match1.location == NSNotFound){
            NSLog(@"Not found!");
        } else {
            NSLog(@"FOUND!!!!");
        }
        //Similarly not found is if xx.length = 0
        if (match2.length == 0){
            NSLog(@"Not found!");
        } else {
            NSLog(@"FOUND!!!!");
        }
        
        //To append a string to a given string:
        NSString *theFirstString = @"Hello";
        NSString *theSecondString = @"World!";
        NSString *helloWorld = [[theFirstString stringByAppendingString: @" "] stringByAppendingString:theSecondString];
        NSLog(@"The string is: %@", helloWorld);
        //pause
        NSLog(@"\n\n\n");
        //CHALLLENGE chapter 16, challenge 1.
        //As seen above for the class method 'rangeOfString' there is a differece when letters are upper/lower case.
        //What's the method that makes no such a differece?
        //Find it and make an example, here match1.location should not be NSNotFound; equivalently match1.length != 0.
        // we use the method as above with the option NSCaseInsensitiveSearch:
        NSRange match3 = [listOfNames rangeOfString: nameWeLookFor1 options: NSCaseInsensitiveSearch];
        if (match3.length != 0){
            NSLog(@"Found it!!!!\n\n\n");
        }
        //CHALLENGE chapter 16, challenge 2. (It is trivial to tanslate the Chapter 6 challenge with the new language. We do something different.)
        NSLog(@"Which name do you want to look for in the string listOfNames?");
        const char *stringa = readline(NULL);
        NSString *nameWeLookForChallenge = [NSString stringWithUTF8String: stringa];
        NSLog(@"You entered %@",nameWeLookForChallenge);
        NSRange challengeMatch = [listOfNames rangeOfString: nameWeLookForChallenge options: NSCaseInsensitiveSearch];
        if (challengeMatch.length != 0){
            NSLog(@"Found it!!!!\n\n\n");
        } else{
            NSLog(@"Not found.");
        }
    }
    return 0;
}