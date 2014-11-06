//
//  main.c
//  Affirmation
//
//  Created by Raffaele Rainone on 06/11/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

int main(int argc, const char * argv[]) {
    
    //test if the number of argumet is correct
    if (argc != 3) {
        fprintf(stderr, "To use need: Affirmation <adjective> <number>.\n");
        return 1;
    }
    
    int count = atoi(argv[2]);
    
    for (int i = 0; i < count; i++) {
        printf("You are %s.\n",argv[1]);
    }

    return 0;
}
