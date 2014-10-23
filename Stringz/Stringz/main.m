//
//  main.m
//  Stringz
//
//  Created by Raffaele Rainone on 23/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableString *str = [[NSMutableString alloc] init];
        [str appendString:@"We create this file to record the following:\n\n"];
        for (int i=0; i<10; i++){
            [str appendString:@"Raffo's cool!\n"];
        }
        NSString *fileToWrite = @"/tmp/cool.txt";//In the book this has not been done. However this may be more useful if for some reason we change the file during the code.
        //We declare the pointer to an NSError object (we don't create it!)
        //The instance will be created ONLY IF we do get an error
        NSError *errorIfWrite;
        BOOL success = [str writeToFile: fileToWrite
              atomically:YES
                encoding:NSUTF8StringEncoding
                   error:&errorIfWrite];//We pass the pointer NSError here (*). If there is an error then the instance is created by this in the chunk of memory pointed by '*error' created above.
                        //NOTICE that (*) is not completely correct. Here we essentially pointing to the pointer (that is pointing to an empty space that will be created if an error occurs).
        //Here we check if we actually have written or not
        if (success) {//in case we have succeed in the writing then the BOOL succes is true so:
            NSLog(@"Writing %@ DONE",fileToWrite);
        } else{//if we have not succeed then it is false and the error pointer has a value:
            NSLog(@"Writing %@ FAILED: %@",fileToWrite,errorIfWrite);
        }
        
        NSString *fileToRead = @"/etc/resolv.conf";
        NSError *errorIfRead;
        NSString *str2 = [[NSString alloc] initWithContentsOfFile: fileToRead
                                                         encoding:NSASCIIStringEncoding
                                                            error:&errorIfRead];
        if (!str2){//!str means str==nil; i.e. if !str==== str=True.
            NSLog(@"Reading failed: %@", errorIfRead);
        } else {
            NSLog(@"%@ is:\n%@", fileToRead, str2);
        }
    }
    return 0;
}