//
//  main.m
//  Speakable
//
//  Created by Raffaele Rainone on 02/11/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSData+Speakable.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //get 8 byte randomly:
        srandom((unsigned int)NULL);
        int64_t randomBytes = (random() << 32) | random();
        
        //wrap randomBytes in an NSDatainstance
        NSData *inData = [NSData dataWithBytes:&randomBytes length:sizeof(int64_t)];
        NSLog(@"In Data = %@.",inData);
        
        //encode the string and print it
        NSString *speakable = [inData encodeAsSpeakableString];
        NSLog(@"Got string: \"%@\"",speakable);
        
        //Now encode the string in an NSData:
        NSError *err;
        NSData *outData = [NSData dataWithSpeakableString:speakable error:&err];
        if(!outData){
            NSLog(@"Unexpected ERROR: %@",[err localizedDescription]);
        }
        NSLog(@"Out data: %@", outData);
        
        //if inData != outData then there is a problem!
        if (![outData isEqual:inData]) {
            NSLog(@"Data coming out is not the same as what went in!");
        }
        
        //Spelling test.
        speakable = @"2 Jeep 3 Halo 7 Teevo 2 Pepsi 2 Volvo";
        outData = [NSData dataWithSpeakableString:speakable error:&err];
        if (!outData) {
            NSLog(@"Expected ERROR: %@",[err localizedDescription]);
        } else{
            NSLog(@"Missed bad string. PROBLEM!");
        }
        
        //just to check the book example:
        if ([[NSData dataWithSpeakableString:@"4 Puma 9 Jeep 3 Sony 5 Fuji 6 Tivo 4 Vogue 5 Nike 5 Honda" error:&err].encodeAsSpeakableString isEqualToString:@"4 Puma 9 Jeep 3 Sony 5 Fuji 6 Tivo 4 Vogue 5 Nike 5 Honda"]) {
            NSLog(@"Everything is fine!");
        } else{
            NSLog(@"Bad..bad..bad.. Find the mistake!!!");
        }
    }
    return 0;
}