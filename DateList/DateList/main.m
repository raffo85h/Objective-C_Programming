//
//  main.m
//  DateList
//
//  Created by Raffaele Rainone on 16/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // We create 3 NSDate objects
        NSDate *now = [NSDate date];
        NSDate *tomorrow = [now dateByAddingTimeInterval:24.0* 60.0* 60.0];//the argument is in seconds - 1day is 24*60*60 seconds.
        NSDate *yesterday = [now dateByAddingTimeInterval:-24.0 * 60.0 * 60.0];
        //Now we create an array with the previous 3 objects
        NSArray * dateList = @[now, tomorrow, yesterday];
        NSLog(@"%@",dateList[1]);
        //to know the length of the array we use [array count] (this is a long unsigned integer)
        NSLog(@"There are %lu elements in our array",[dateList count]);
        
        //let's print the elements of the array with a for cycle
        for (NSDate *d in dateList) {
            NSLog(@"The date is: %@\n\n", d);
        }
        //Arrays within NSArray cannot be modified! (no append/remove elements, no reorder/sorting); for these purposes we have NSMutableArray.
        //We change the above using this new class. First we create an empty array:
        NSMutableArray *dateList2 = [NSMutableArray array];// the Class method array gives an empty array. We can also use the sintax: NSMutableArray *dateList2 = [[NSMutableArray alloc] init];
        //Now we add today and tomorrow in the empty array
        [dateList2 addObject: now];
        [dateList2 addObject: tomorrow];
        //So the array is [now, tomorrow] (this is different from [tomorrow, now]!).
        //Now we add yesterday in the first position.
        [dateList2 insertObject: yesterday atIndex: 0];
        //and now we print the array elements:
        for (NSDate *d in dateList2){
            NSLog(@"This is a date: %@",d);
        }
        //If we want to remove the elements at the position 0:
        [dateList2 removeObjectAtIndex:0];
        //Let's check that the first object is: now
        NSLog(@"The first date is %@", dateList2[0]);
        NSLog(@"\n\n");
        
        //Old fashion methods to create an array:
        NSArray *dateListOldStyle = [NSArray arrayWithObjects:now, tomorrow, yesterday, nil];//nil tells that when to close the array.
        
        //let's print an element in a give position (always using an old fashioned method):
        NSLog(@"The first date is %@", [dateListOldStyle objectAtIndex:0]);
        
        //CHALLENGE chapter 17, challenge 1
        //in the new project called "Groceries".
    }
    return 0;
}