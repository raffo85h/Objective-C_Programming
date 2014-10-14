//
//  main.c
//  TwoFloats
//
//  Created by Raffaele Rainone on 10/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{
    float first_variable;
    float second_variable;
    double the_sum_mine;
    
    first_variable = 3.14;
    second_variable = 1212.1985;
    
    the_sum_mine = first_variable + second_variable;
    
    printf( "the double variable is equal to %f.\n", the_sum_mine );
    
    return 0;
}