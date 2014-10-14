//
//  main.c
//  ClassCertificates
//
//  Created by Raffaele Rainone on 11/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#include <stdio.h>
#include <unistd.h>

void congratulateStudent(char *student, char *course, int numDays)
{
    printf("%s ha fatto tanta programmazione %s quanta ne potrei fare in %d giorni.\n", student, course, numDays);
}

int main (int argc, const char * argv[])
{
    congratulateStudent("Kate", "Cocoa", 5);
    sleep(2);
    congratulateStudent("Bo", "Objective-C", 2);
    sleep(2);
    congratulateStudent("Mike", "Python", 5);
    sleep(2);
    congratulateStudent("Liz", "iOS", 5);
    
    return 0;
}