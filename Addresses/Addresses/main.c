//
//  main.c
//  Addresses
//
//  Created by Raffaele Rainone on 12/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[])
{
    int i = 19;
    int *addressOfI = &i;
    printf("i registra il suo valore in %p.\n", addressOfI);
    printf("questa funzione inizia in %p\n", main);
    printf("l'int registrato di addressOfI e' %d\n\n", *addressOfI);
    
    *addressOfI = 89;
    printf("Ora i e' %d.\n\n", i);
    
    printf("Un int occup %zu byte.\n", sizeof(i));
    printf("Un puntatore occupa %zu byte.\n\n", sizeof(addressOfI));



// SFIDA1: scrivete un programma che visualizzi quanta memoria consuma un float
    printf("SFIDA1:\n");
    printf("Un float occuoa %zu byte.\n", sizeof(float));
    printf("Un puntatore a una variabile float occupa %zu byte.\n\n", sizeof(float *));
    
//SFIDA2: quanta memoria consuma uno short (intero short con segno)?
//di conseguenza: qual'e' il piu' piccolo numero che uno short puo' registrare? e il piu' grande?
//Lo stesso per 'unsigned short' (che contiene solo numeri non negativi). Qual'e' il max? (Il min e' 0).
    
    //prima misuriamo quanta memoria occupa uno short
    printf("SFIDA2:\n");
    printf("Uno short occupa %zu byte.\n", sizeof(short));
    //mi dice che occupa 2byte, cioe' 2*8=16 bit. Quindi il range e' [-2^(16-1)+1,2^(16-1)-1].
    printf("Un unsigned short occupa %zu byte.\n", sizeof(unsigned short int));
    // quindi il max e': [0,2^16-1] = max e' 2^16-1 = 65535.

    return 0;
}