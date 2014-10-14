//
//  main.c
//  CountDown
//
//  Created by Raffaele Rainone on 12/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#include <readline/readline.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, const char * argv[])
{
    printf("Where do you want to staart the Count Down? ");
    int countDownStart = atoi(readline(NULL));
    
    for (int i; i <= countDownStart; i += 3) {
        if ((countDownStart-i)%5 == 0)
        {
            printf("%d\nTrovato uno!\n", countDownStart-i);
        } else {
            printf("%d\n", countDownStart-i);
        }
    }

    return 0;
}
