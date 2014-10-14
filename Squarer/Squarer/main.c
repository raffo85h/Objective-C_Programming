//
//  main.c
//  Squarer
//
//  Created by Raffaele Rainone on 11/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#include <stdio.h>

void theNeededFunction(int n)
{
    printf("\"%d\" al quadrato e' \"%d\".\n", n, n*n);
}

int main(int argc, const char * argv[]) {
    theNeededFunction(5);
    return 0;
}
