//
//  main.m
//  ClassAct
//
//  Created by Raffaele Rainone on 06/11/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "BNRTowel.h"

NSArray *BNRHierarchyForClass(Class cls){
    //we create an array that will comprise a list of the given class and all its superclasses
    NSMutableArray *classHierarchy = [NSMutableArray array];
    
    //we add all the superclass to the array, till we reach a class that has no superclass
    for (Class c = cls; c != nil; c = class_getSuperclass(c)) {
        NSString *className = NSStringFromClass(c);
        [classHierarchy insertObject:className atIndex:0];
    }
    return classHierarchy;
}

NSArray *BNRMethodsForClass(Class cls){
    unsigned int methodCount = 0;
    
    Method *methodList = class_copyMethodList(cls, &methodCount);
    NSMutableArray *methodArray = [NSMutableArray array];
    for (int i = 0; i < methodCount; i++) {
        //the current method is:
        Method currentMethod = methodList[i];
        //get the selector of such a method:
        SEL methodSelector = method_getName(currentMethod);
        //add the name of the selector to the array:
        [methodArray addObject:NSStringFromSelector(methodSelector)];
    }
    return methodArray;
}

//CHALLENGE: get also the instance variables
NSArray *BNRInstanceVariavleForClass(Class cls){
    unsigned int instanceVariableCount = 0;
    
    Ivar *instanceVariableList = class_copyIvarList(cls, &instanceVariableCount);
    NSMutableArray *instanceVariableArray = [NSMutableArray array];
    for (int i = 0; i < instanceVariableCount; i++) {
        Ivar currentInsVar = instanceVariableList[i];
        NSString *instVarName = [NSString stringWithUTF8String:ivar_getName(currentInsVar)];
        [instanceVariableArray addObject:instVarName];
    }
    return instanceVariableArray;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //we create an instance of BNRTowel.
        BNRTowel *myTowel = [BNRTowel new];
        [myTowel addObserver:nil
                  forKeyPath:@"location"
                     options:NSKeyValueObservingOptionNew
                     context:NULL];
        
        //we create an array whose elements will be dictionaries.
        //each dictionary will contain: name of a class, hierachy/methods of such a class
        NSMutableArray *runtimeClassesInfo = [NSMutableArray array];
        
        //the number of how many class we are using will be:
        unsigned int classCount = 0;
        
        //now we get a pointer to a list of all the classes registered in the app
        //The number above will be given using a reference:
        Class *classList = objc_copyClassList(&classCount);
        
        //now we go through each class in the list:
        for (int i = 0; i < classCount; i++) {
            //classList is like a C array, whose elements are classes:
            Class currentClass = classList[i];
            
            //the name of the class is stored as a string:
            NSString *className = NSStringFromClass(currentClass);
            
            //we use the methods defined above:
            NSArray *hierarchy = BNRHierarchyForClass(currentClass);
            NSArray *methods = BNRMethodsForClass(currentClass);
            NSArray *instanceVariables = BNRInstanceVariavleForClass(currentClass);
            //so we create the dictionary with key and value these two arrays:
            NSDictionary *classInfoDict = @{ @"className":className,
                                             @"hierarchy":hierarchy,
                                             @"methods":methods,
                                             @"instance variables":instanceVariables};
            //add this dictionary to the array
            [runtimeClassesInfo addObject:classInfoDict];
        }
        //we don't use the buffer of class list anymore so we vacue it
        free(classList);
        
        //sort the array runClassTime alphabetically.
        //to do this we need to create a sort descriptor:
        NSSortDescriptor *alphaAsc = [NSSortDescriptor sortDescriptorWithKey:@"name"
                                                                  ascending:YES];
        //now we use it to create a new array that is the runclasstime sorted:
        NSArray *sortedArray = [runtimeClassesInfo sortedArrayUsingDescriptors:@[alphaAsc]];
        //so we print it:
        //first we see how many elements there are
        NSLog(@"There are %ld registered classes for this app.",sortedArray.count);
        //and we print them:
        NSLog(@"%@",sortedArray);
        
    }
    return 0;
}
