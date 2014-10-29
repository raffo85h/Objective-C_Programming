//
//  BNROwnedAppliance.m
//  Appliances
//
//  Created by Raffaele Rainone on 28/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#import "BNROwnedAppliance.h"

@interface BNROwnedAppliance()
{
    NSMutableSet *_ownerNames;
}
@end

@implementation BNROwnedAppliance

//THE FOLLOWING IS THE DESIGNATED INIIALIZER (pg 309).
- (instancetype)initWithProductName:(NSString *)pn
                    firstOwnerName:(NSString *)n
{
    //we recal the superclass init
    if (self == [super initWithProductName:pn]){
        //we create _ownerNames
        _ownerNames = [[NSMutableSet alloc] init];
        if (n){//the usual check -- se pg.304
            [_ownerNames addObject:n];
        }
    }
    //retunt it
    return self;
}

//as for the other class we may have a big problem if in the code we do:
//BNROwnedAppliance *a = [[BNROwnedAppliance alloc] initWithProductName:@"something"].
//The problem arises because it does not initialize ownerNames!!! So when we will try to add something to it we'll get an error.

- (instancetype)initWithProductName:(NSString *)pn
{
    return [self initWithProductName:pn firstOwnerName:nil];
}

-(void) addOwnerName:(NSString *)n
{
    [_ownerNames addObject:n];
}

- (void)removeOwnerName:(NSString *)n
{
    [_ownerNames removeObject:n];
}

- (NSSet *)ownerNames
{
    return [_ownerNames copy];
}

@end