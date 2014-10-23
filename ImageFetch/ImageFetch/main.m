//
//  main.m
//  ImageFetch
//
//  Created by Raffaele Rainone on 23/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSURL *url = [NSURL URLWithString: @"http://www.google.com/images/logos/ps_logo2.png" ];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        NSError *error = nil;
        NSData *data = [NSURLConnection sendSynchronousRequest:request
                                             returningResponse:NULL
                                                         error:&error];
        if (!data){//if there is no data:
            NSLog(@"Download failed: %@",[error localizedDescription]);
            return 1;//END the program here if there is an ERROR
        }
        NSLog(@"The file is %lu byte.", (unsigned long)[data length]);
        
        BOOL written = [data writeToFile:@"/tmp/google.png"
                                 options:NSDataWritingAtomic//we could just write 0 rather than NSData... but this is useful because with this command the process is as follows:
                                    //1.we write the data in a temporary file-2.when the download is complete this temporary file will become permanent (simply, the system will change the temporary name in the final name).
                                //I is convenient to do so because if for example there is a crash then there is no download at all (if the temporary file has not been fully downloaded). Instead if we just put '0' and the elctricity goes off then we may end up with a half-written-file, that is garbage!
                                   error:&error];
        if (!written){//if it has not been written:
            NSLog(@"Writing failed: %@",[error localizedDescription]);
            return 1;//END the program here if there is an ERROR
        }
        
        NSLog(@"Success!");
        
        NSData *readData = [NSData dataWithContentsOfFile:@"/tmp/google.png"];
        NSLog(@"The file read is %lu byte.",(unsigned long)[readData length]);
        
        //Suppose I want to write on a file in the Desktop then:
        //the following gives us an array that comprises paths:
        NSArray *desktop = NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES);

        //Since we are looking for 'Desktop' and we know that there is only one desktop then we pick the first element of the array desktop:
        NSMutableString *desktopPath = desktop[0];//This gives us something like '/Users/Name/Desktop' so we need to add "/nameFile.txt" to it.
        NSLog(@"%@",desktopPath);
//        [desktopPath appendFormat:@"/cool.txt"];//THIS DOES NOR WORK!!! :(
    }
    return 0;
}