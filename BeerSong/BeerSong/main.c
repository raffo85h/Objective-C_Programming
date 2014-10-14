//
//  main.c
//  BeerSong
//
//  Created by Raffaele Rainone on 11/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#include <stdio.h>

void singSongFor( int numberOfBottles)
{
    if (numberOfBottles == 0)
    {
        printf("Non ci sono piu' bottiglie gi birra sul muro.\n\n");
    } else
    {
        printf("%d bottiglie di birra sul muro. %d bottiglie di birra.\n", numberOfBottles, numberOfBottles);
        int oneFewer = numberOfBottles - 1;
        printf("Prendine una, falla passare, %d bottiglie di birra sul muro.\n\n", oneFewer);
        singSongFor(oneFewer);
        
        printf("Metti una bottiglia nel cestino, %d bottiglie vuote nel cestino.\n", numberOfBottles);
    }
}


int main(int argc, const char * argv[])
{
    singSongFor(4);
    
    return 0;
}
