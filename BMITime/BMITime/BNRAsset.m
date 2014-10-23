//
//  BNRAsset.m
//  BMITime
//
//  Created by Raffaele Rainone on 20/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#import "BNRAsset.h"
#import "BNREmployee.h"

@implementation BNRAsset

- (NSString *)description
{
    if (self.holder)
    {
        return [NSString stringWithFormat:@"<%@: $%d, assigned to %@>", self.label, self.resaleValue, self.holder];
    }
    else{
        return [NSString stringWithFormat:@"<%@: $%u, unassigned>", self.label, self.resaleValue];
    }
}
<<<<<<< HEAD
//change the deallocation method:
=======

>>>>>>> 47cf9a6df094a48b0a93cc99ad6e98a0bd0088c7
- (void)dealloc
{
    NSLog(@"Dealloco %@",self);
}

@end