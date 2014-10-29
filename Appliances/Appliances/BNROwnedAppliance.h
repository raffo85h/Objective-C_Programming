//
//  BNROwnedAppliance.h
//  Appliances
//
//  Created by Raffaele Rainone on 28/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#import "BNRAppliance.h"

@interface BNROwnedAppliance : BNRAppliance

@property(readonly)NSSet *ownerNames;

-(instancetype)initWithProductName:(NSString *)pn//DESIGNATED INIIALIZER (pg 309)
                    firstOwnerName:(NSString *)n;
-(void)addOwnerName:(NSString *)n;
-(void)removeOwnerName:(NSString *)n;

@end
