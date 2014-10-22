//
//  main.m
//  BMITime
//
//  Created by Raffaele Rainone on 17/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "BNRPerson.h"
#import "BNREmployee.h"
#import "BNRAsset.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //Create a mutable array that comprises objects of BNREmployee
        NSMutableArray *employees = [[NSMutableArray alloc] init];
        
        //We create a dictionary with executive people:
        NSMutableDictionary *executives = [[NSMutableDictionary alloc] init];
        
        //Now we create 10 employee (all mikeys) - the first will be the CEO the second the CTO:
        for (int i=0; i<10; i++)
        {
            //create one instance og BNREmployee
            BNREmployee *mikey = [[BNREmployee alloc ] init];
            
            //define the desired variables
            mikey.weightInKilos = 90+i;
            mikey.heightInMeters = 1.8 - i/10.0;
            mikey.employeeID = i;
            
            //Now we add the emplyee to the array employees
            [employees addObject:mikey];
            
            //is this the first/second? Then it is the CEO/CTO and we add it to the dictionary.
            if (i==0){
                [executives setObject: mikey forKey:@"CEO"];
            }
            if (i==1){
                [executives setObject: mikey forKey:@"CTO"];
            }
        }
        
        NSMutableArray *allAssets = [[NSMutableArray alloc] init];
        
        //now we create 10 assets and we randomly allocate each of these assets to the 10 employees in the array employees.
        for (int i=0; i<10; i++)
        {
            //create the asset
            BNRAsset *asset = [[BNRAsset alloc] init];
            
            //give a label to the asset:
            NSString *currentLabel = [NSString stringWithFormat:@"Laptop %d", i];
            asset.label = currentLabel;
            asset.resaleValue = i*17;
            
            //let's take a random integer in {0,1,2,3,4,5,6,7,8,9}.
            NSUInteger randomIndex = random() % [employees count];
            
            //Let's find that employee:
            BNREmployee *randomEmployee = [employees objectAtIndex:randomIndex];
            
            //we give an asset to the random employee
            [randomEmployee addAssets:asset];
            
            //add this asset to the array allAssets:
            [allAssets addObject: asset];
        }
        
        BNRAsset *otherAsset = [[BNRAsset alloc] init];
        otherAsset.label = [NSString stringWithFormat:@"Iphone"];//otherLabel;
        otherAsset.resaleValue = 629;
        [[employees objectAtIndex:9] addAssets:otherAsset];
        [allAssets addObject: otherAsset];
        
        //I want to remove the asset called "Laptop 4". Since the assets have been allocated randomly I have to check all the assets of all the employees.
        
        for (BNREmployee *e in employees)
        {
            for (BNRAsset *a in e.assets)
            {
                if ([a.label isEqualToString: @"Laptop 4"])
                {
                    [e removeAssets:a];
                }
            }
        }
        
        //Now we sort the array 'employees' according First the value of assets and then by the employeeID. In other words first we put all the employees with asset value 0$, and we order those by their ID and so on.
        //NOTICE that if the array is NSArray and not NSMutableArray then we cannot sort it (as the sorting process has to modify the array). However, we can copy it to a mutable array (mutable!) and sort the new array.
        NSSortDescriptor *voa = [NSSortDescriptor sortDescriptorWithKey:@"valueOfAssets" ascending:YES];//voa stands for 'Value Of Assets'
        NSSortDescriptor *eid = [NSSortDescriptor sortDescriptorWithKey:@"employeeID" ascending:YES];//eid stands for "Employee I D"
        [employees sortUsingDescriptors:@[voa,eid]];//Now we order the array employee using as first criterium VOA and if two employees have same voa then we order them using EID.

        NSLog(@"Employees: %@",employees);
        NSLog(@"Deallocate poperties of the employee number 5.");
        [employees removeObjectAtIndex:5];//with this we deallocate the emplyees in the position 5 in the array. Consequentely, this deallocate the assets of the employee 5.
        NSLog(@"allAssets: %@\n\n", allAssets);
        
        //We print the Dictionary
        NSLog(@"Executives are: %@",executives);
        
        //Now we print the details of the CEO:
        NSLog(@"CEO: %@\n\n",executives[@"CEO"]);
        //we don't need the dictionary anymore so we set itto nil
        executives = nil;
        
        //Now we FILTER the array allAssets according to a PREDICATE. In othetr words we decide to display only certain elements of such array (we shall display the assets with value > 70).
        //NOTICE that allAssets is NSArray (i.e. NOT Mutable). So we use the method -(NSArray *)filteredArrayUsingPredicate:..; that create a new array with the elements that satisfy the predicate.
        //NOTICE THAT WE CAN FILTER SET AS WELL.
        //the predicate can be very complex, Apple has a 'Predicate Programming Guide' to be consulted when we have to create complex predicate:
        //********************************************************************************************
        //https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/Predicates/Predicates.pdf
        //********************************************************************************************
        //First we define the Predicate:
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"holder.valueOfAssets > 70"];
        //Now we filter it:
        NSArray *toBeReclaimed = [allAssets filteredArrayUsingPredicate:predicate];
        NSLog(@"to be reclaimed: %@",toBeReclaimed);
        //and now we don't need the array to be reclaimed anylonger so we nil it:
        toBeReclaimed = nil;
        
        NSLog(@"Deallocate properties of array");

        allAssets = nil;
        employees = nil;//this is to say that the array can be destroyed since we won't use it anymore. This is important to save the memory allocated to this array.
        //This change to nil says that the arrray has no property anymore so it is deallocated. This causes a chain reaction --> no one of the employees has a property any longer. Therefore they are deallocated.
    }
    return 0;
}