//
//  BNRAppliance.h
//  Appliances
//
//  Created by Raffaele Rainone on 28/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRAppliance : NSObject

@property (nonatomic, copy) NSString *productName;
@property (nonatomic) int voltage;

- (instancetype)initWithProductName:(NSString *)pn;//DESIGNATED INIIALIZER (pg 309)

@end
