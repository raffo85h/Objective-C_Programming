//
//  main.c
//  Coolness
//
//  Created by Raffaele Rainone on 12/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#include <readline/readline.h>
#include <stdio.h>

int main(int argc, const char * argv[])
{
    printf("Who is cool? ");
    const char *name = readline(NULL);
    printf("%s is cool!\n\n", name);

    return 0;
}
