//
//  main.c
//  Turkey
//
//  Created by Raffaele Rainone on 10/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{
    // dichiara la variabile denominata 'weight' di tipo float
    float weight;
    
    // diamole un valore
    weight = 7.1;
    
    //stampalo
    printf("Il tacchino persa %f.\n",weight);
    
    //dichiara l'altra variabile
    float cookingTime;
    
    //calcola tempo di cottura
    cookingTime = 15.0 + 30.0 * weight;
    
    //stampalo
    printf("cuocere per %f minuti.\n", cookingTime);
    
    //termina la funzione e indica il successo
    return 0;
}
