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
//change the deallocation method:
- (void)dealloc
{
    NSLog(@"Dealloco %@",self);
}

@end