//
//  main.m
//  TimesTwo
//
//  Created by Raffaele Rainone on 14/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //declare pointer called currentTime and print its value
        NSDate *currentTime = [NSDate date];
        NSLog(@"Il valore di currentTime e' %p.", currentTime);
        //in the following we shall modify currentTime, hence we record its value in the following new pointer
        NSDate *startTime = currentTime;
        
        //wait 2 sec
        sleep(2);
        
        //change the vale of the pointer defined above and print its new value
        currentTime = [NSDate date];
        NSLog(@"Dopo 2 secondi, il valore di currentTime e' %p.", currentTime);
        NSLog(@"L'indirizzo di currentTime in origine e' %p", startTime);
        
        //Mow I do not need currentTime any longer. Hence it OK to destroy it in order to tell the machine that
        //the chunk of memory towards which current time was pointing is free and can be used by something different.
        //It is enough to give the pointer the value "nil".
        currentTime = nil;
        
        //Let's check that the value of current time is nothig, i.e. 0x0
        NSLog(@"Ora, il valore di currentTime e' %p.", currentTime);
    }
    return 0;
}
