//
//  BNRLogger.m
//  Callbacks
//
//  Created by Raffaele Rainone on 24/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#import "BNRLogger.h"

@implementation BNRLogger

- (NSString *)lastTimeString
{
    static NSDateFormatter *dateFormatter = nil;
    if (!dateFormatter){
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
        NSLog(@"created dateFormatter");
    }
    return [dateFormatter stringFromDate:self.lastTime];
}

-(void)updateLastTime:(NSTimer *)t
{
    NSDate *now = [NSDate date];
    [self setLastTime:now];
    NSLog(@"Time set to: %@", self.lastTimeString);
}

//any time new data is coming we call the following:
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"received %lu byte",[data length]);
    //create an NSMutable data (if it does not already exist)
    if (!_incomingData){
        _incomingData = [[NSMutableData alloc] init];
    }
    [_incomingData appendData:data];
}

//the following will be called any time the last chunk of data has been done:
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"Everything has been received");
    NSString *string = [[NSString alloc] initWithData:_incomingData
                                             encoding:NSUTF8StringEncoding];
    _incomingData = nil;
    NSLog(@"The string has %lu characters", [string length]);
    //If you want to know the whole donwloaded file then un-comment the following:
    //NSLog(@"The string is %@",string);
}

//The following will be called if the download fails:
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"Connection failed: %@", [error localizedDescription]);
    _incomingData = nil;
}

/*
-(void)zoneChange:(NSNotification *)note
{
    NSLog(@"The time zone has changed.");
}
*/
@end