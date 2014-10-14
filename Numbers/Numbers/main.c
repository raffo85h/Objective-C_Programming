//
//  main.c
//  Numbers
//
//  Created by Raffaele Rainone on 11/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(int argc, const char * argv[])
{
    unsigned long x = 255;
    printf("x e' %lu.\n", x);
    printf("In ottale, x e' %lo.\n", x);
    printf("In esadecimale, x e' %lx.\n", x);
    
    printf("3 * 3 + 5 * 2 = %d.\n", 3*3+5*2);
    printf("11/3 = %d. con resto di %d.\n", 11/3, 11%3);
    printf("11/3.0 = %f.\n", 11.0/3 );
    printf("Il valore assoluto di -5 e' %d.\n", abs(-5));
    
    double y = 12345.6789;
    printf("y e' %f.\n", y);
    printf("y e' %e.\n", y);
    
//SFIDA: usando la libreria math, stampate il valore di sin(1)
//arrotondato a 3 cifre dopo il punto decimale.
    printf("Il valore di sin(1) e' %.3f.\n", sin(1));
    
    return 0;
}
