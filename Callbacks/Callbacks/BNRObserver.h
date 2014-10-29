//
//  BNRObserver.h
//  Callbacks
//
//  Created by Raffaele Rainone on 29/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRObserver : NSObject
-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary *)change
                      context:(void *)context;
@end
