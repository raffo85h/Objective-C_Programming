//
//  main.c
//  Degrees
//
//  Created by Raffaele Rainone on 11/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

float lastTemperature;

float fahrenheitFromCelsius(float cel)
{
    lastTemperature = cel;
    float fahr = cel * 1.8 + 32.0;
    printf("%f Celsius sono %f Fahrenheit.\n", cel, fahr);
    return fahr;
}

int main(int argc, const char * argv[])
{
    float freezeInC = 0;
    float freezeInF = fahrenheitFromCelsius(freezeInC);
    printf("Punto di congelamento dell'acqua a %f gradi F.\n", freezeInF);
    printf("Ultima temperatura convertita %f.\n", lastTemperature);
    return EXIT_SUCCESS;
}