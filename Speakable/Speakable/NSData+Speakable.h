//
//  NSData+Speakable.h
//  Speakable
//
//  Created by Raffaele Rainone on 02/11/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Speakable)

- (NSString *)encodeAsSpeakableString;
+ (NSData *)dataWithSpeakableString:(NSString *)s error:(NSError **)e;

@end
