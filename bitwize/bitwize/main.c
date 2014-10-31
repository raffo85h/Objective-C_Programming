//
//  main.c
//  bitwize
//
//  Created by Raffaele Rainone on 31/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#include <stdio.h>

//CHALLENGE, Chapter 38
//Write C code to get a 64bit (odd) unsigned integer with alternating 0 and 1 in its byte.

int main(int argc, const char * argv[]) {
    unsigned long long int x = 0;
    for (int i = 2 ; i < 64 ; i += 2){//For the even one then i=1....
        unsigned long long int y = 1LL << i;
        x |= y;
    }
    printf("Decimal x = %llu \n\n",x);
    return 0;
}