//
//  main.c
//  Triangle
//
//  Created by Raffaele Rainone on 11/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#include <stdio.h>

float remainingAngle(A,B)
{
    float C = 180.0 - A - B;
    return C;
}

int main(int argc, const char * argv[]) {
    float angleA = 30.0;
    float angleB = 60.0;
    float angleC = remainingAngle(angleA,angleB);
    printf("Terzo angolo %.2f.\n", angleC);
    return 0;
}
