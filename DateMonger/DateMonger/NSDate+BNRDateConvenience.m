//
//  NSDate+BNRDateConvenience.m
//  DateMonger
//
//  Created by Raffaele Rainone on 30/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#import "NSDate+BNRDateConvenience.h"

@implementation NSDate (BNRDateConvenience)

+(NSDate*)raf_giveDay:(NSInteger)day giveMonth:(NSInteger) month giveYear:(NSInteger)year
{
    NSDateComponents *date = [[NSDateComponents alloc] init];
    [date setYear:year];
    [date setMonth:month];
    [date setDay:day];
    [date setHour:1];//my time zone is +1 the one it Log is GMT
    [date setMinute:0];
    [date setSecond:0];
    NSCalendar *gregorianCal = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSTimeZone *raf_timeZone = [NSTimeZone timeZoneForSecondsFromGMT:3600];
    [gregorianCal setTimeZone:raf_timeZone];
    NSDate *output = [gregorianCal dateFromComponents:date];
    return output;
}

@end