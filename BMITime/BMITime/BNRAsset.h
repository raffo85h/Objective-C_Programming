//
//  BNRAsset.h
//  BMITime
//
//  Created by Raffaele Rainone on 20/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BNREmployee;

@interface BNRAsset : NSObject

@property (nonatomic, copy) NSString *label;
@property (nonatomic, weak) BNREmployee *holder;//if we remove the 'weak' we get a piece of code with a Strong Circular Riferiment (try to remove it, run the code - first note that the output is wrong - then open Product -> Profile -> Leak and in Leaks/Cycle&Roots you can see the cycle).
        //IN PRINCIPLE: father must possess the son; but son must not possess the father!
@property (nonatomic) unsigned int resaleValue;

@end
