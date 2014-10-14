//
//  main.c
//  PBR
//
//  Created by Raffaele Rainone on 12/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#include <stdio.h>
#include <math.h>

void metersToFeetAndInches(double meters, unsigned int *ftPtr, double *inPtr)
{
    //This function assumes that meters>=0.
    
    //Convert meters in a float of feet.
    double rawFeet = meters * 3.281;

    // SFIDA: Use modf() rather than FLOOR
    double inches, feet;
    inches = modf(rawFeet, &feet);
    *inPtr = inches * 12.0;
    *ftPtr = (int)feet;
    if (ftPtr)
    {
        printf("Register %u in the address %p.\n", *ftPtr, ftPtr);
    }
    if (inPtr)
    {
        printf("Register %.2f inches in the address %p.\n", inches, inPtr);
    }

/*
    //Now we compute the number of feet, only as integer.
    unsigned int feet = (unsigned int)floor(rawFeet);

    //Register the number of feet in the given address. Only if the memory address is not NULL
    if (ftPtr)
    {
        printf("Register %u in the address %p.\n", feet, ftPtr);
        *ftPtr = feet;
    }

    //Now we compute the inches.
    double fractionalFoot = rawFeet - feet;
    double inches = fractionalFoot *12.0;

    //Register the number of inches in the given address. Again, only if the memory address is not NULL
    if (inPtr)
    {
        printf("Register %.2f inches in the address %p.\n", inches, inPtr);
        *inPtr = inches;
    }*/
}

int main(int argc, const char * argv[])
{
    double meters = 3.0;
    unsigned int feet;
    double inches;

    metersToFeetAndInches(meters, &feet, &inches);
    printf("%.1f meters is equivalent to %d feet and %.1f inches.\n", meters, feet, inches);

    return 0;
}
