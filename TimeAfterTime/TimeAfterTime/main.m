//
//  main.m
//  TimeAfterTime
//
//  Created by Raffaele Rainone on 13/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool
    {
        //NSDate *now = [NSDate date];//let us use alloc and init:
        NSDate *now = [[NSDate alloc] init];
        NSLog(@"Questo oggetto NSDate vive in %p.\n:", now);
        NSLog(@"Data: %@.\n\n", now);
        
        double seconds = [now timeIntervalSince1970];
        NSLog(@"Sono passati %f dall'inizio del 1970.\n\n", seconds);
        /*
        //Invio messaggi sbagliati per vedere errori..
        double testSeconds = [NSDate timeIntervalSince1970];
        NSDate *testNow = [now date];
        
        //Nome di selettore errato
        testSeconds = [now fooIntervalSince1970];
        
        //Errore! i e s minuscole:
        testSeconds = [now timeintervalsince1970];
        */
        
        //SFIDA, ch13: stampare nome del mio computer. Si useranno le classi NSHost e NSString.
        NSLog(@"**********\n");
        NSLog(@"SFIDA\n");
        NSLog(@"**********\n");
        
        NSHost *myComputer = [NSHost currentHost];
        NSString *nameOfMyComputer = [myComputer localizedName];
        NSLog(@"Il nome del mio computer e': %@.\n\n\n\n", nameOfMyComputer);
        
        //CHAPTER 14.
        NSDate *later = [now dateByAddingTimeInterval: 100000];
        NSLog(@"Tra 100mila secondi sara': %@",later);
        
        NSCalendar *cal = [NSCalendar currentCalendar];
        NSLog(@"My calendar is %@.\n", [cal calendarIdentifier]);
        unsigned long day = [cal ordinalityOfUnit: NSDayCalendarUnit
                                           inUnit: NSMonthCalendarUnit
                                          forDate: now];
        NSLog(@"Today is %lu.\n", day);
        
        //SFIDA ch14: How many seconds have I lived so far?
        //1.Set the date and time of whenI born:
        NSDateComponents *whenIBornAsCalendar = [[NSDateComponents alloc] init];
        [whenIBornAsCalendar setYear: 1985];
        [whenIBornAsCalendar setMonth: 12];
        [whenIBornAsCalendar setDay: 12];
        [whenIBornAsCalendar setHour: 14];
        [whenIBornAsCalendar setMinute: 15];
        [whenIBornAsCalendar setSecond: 0];
        NSLog(@"When I born is: %@.\n\n", whenIBornAsCalendar);
        NSCalendar *g = [[NSCalendar alloc] initWithCalendarIdentifier: NSGregorianCalendar];
        NSLog(@"The instance g is: %@.\n\n", g);
        NSDate *dateOfBirth = [g dateFromComponents: whenIBornAsCalendar];
        NSLog(@"This is when I born: %@.\n\n", dateOfBirth);
        double secondsSinceIBorn = [now timeIntervalSinceDate: dateOfBirth];
        NSLog(@"%f.\n", secondsSinceIBorn);
    }
    return 0;
}
