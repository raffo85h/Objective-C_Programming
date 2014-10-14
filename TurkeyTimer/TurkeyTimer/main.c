//
//  main.c
//  TurkeyTimer
//
//  Created by Raffaele Rainone on 11/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#include <stdio.h>

void showCookTimeForTurkey(int chili)
{
    int necessaryMinutes = 15 + 30*chili;
    printf("Cuocere per %d minuti.\n", necessaryMinutes);
    if (necessaryMinutes > 120)
    {
        int halfway = necessaryMinutes / 2;
        printf("Girare dopo %d dei %d minuti.\n", halfway, necessaryMinutes);
    }
}

int main(int argc, const char * argv[])
{
    int totalWeight = 5;
    int gibletsWeight = 1;
    int turkeyWeight = totalWeight - gibletsWeight;
    showCookTimeForTurkey(turkeyWeight);
    
    return 0;
}
