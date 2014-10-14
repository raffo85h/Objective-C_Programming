//
//  main.c
//  BMICalc
//
//  Created by Raffaele Rainone on 12/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#include <stdio.h>

/* CHAPTER STUFF
//dichiarazione della struct
typedef struct
{
    float heightInMeters;
    int weightInKilos;
} Person;

float bodyMassIndex(Person p)
{
    return p.weightInKilos/(p.heightInMeters * p.heightInMeters);
}

int main(int argc, const char * argv[])
{
    Person mikey;
    mikey.heightInMeters = 1.7;
    mikey.weightInKilos = 96;
    
    Person aaron;
    aaron.heightInMeters = 1.97;
    aaron.weightInKilos = 84;
    
    printf("mikey e' alto %.2f metri.\n", mikey.heightInMeters);
    printf("mikey pesa %d chilogrammi.\n\n", mikey.weightInKilos);
    printf("aaron e' alto %.2f metri.\n", aaron.heightInMeters);
    printf("aaron pesa %d chilogrammi.\n\n", aaron.weightInKilos);
    
    float bmi;
    bmi = bodyMassIndex(mikey);
    printf("mikey ha un BMI di %.2f.\n\n", bmi);
    
    bmi = bodyMassIndex(aaron);
    printf("aaron ha un BMI di %.2f.\n\n", bmi);

    return 0;
}
*/

//PARTE FINALE DEL CAPITOLO: LA SFIDA.
#include <time.h>

int main(int argc, const char * argv[])
{
    long secondsSince1970 = time(NULL);
    printf("Sono passti %ld sec dal 1970.\n", secondsSince1970);
    
    struct tm now;
    localtime_r(&secondsSince1970, &now);
    
    printf("Sono le %d:%d:%d.\n", now.tm_hour, now.tm_min, now.tm_sec);
    printf("La data di oggi e' %d-%d-%d.\n\n\n", now.tm_mon+1, now.tm_mday, now.tm_year+1900);
    
    long secondsPlusFourMillions = time(NULL)+4000000;
    
    printf("In 4 Million seconds the number of seconds passed since 1970 will be %ld.\n", secondsPlusFourMillions);
    
    //Nel futuro, prima definisco la struttura
    struct tm future;
    localtime_r(&secondsPlusFourMillions, &future);
    
    //Ora nel futuro.
    printf("Tra 4 Milioni di secondi saranno le le %d:%d:%d.\n", future.tm_hour, future.tm_min, future.tm_sec);
    
    //Data nel futuro
    printf("La data tra 4 Milioni di secondi sara %d-%d-%d.\n", future.tm_mon+1,future.tm_mday, future.tm_year+1900);
    
    

//SFIDA: quale sara' la data tra 4milioni di secondi?
    return 0;
}