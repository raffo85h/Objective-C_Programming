//
//  main.m
//  Constantz
//
//  Created by Raffaele Rainone on 22/10/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
<<<<<<< HEAD
        NSLog(@"\u03c0 is %f.", M_PI);
        NSLog(@"%d is greater.",MAX(12, 7));
        
        NSLocale *here = [NSLocale currentLocale];
        NSString *currency = [here objectForKey:NSLocaleCurrencyCode];//we can also write objectForKey:@"currency"; but one has to be careful...better using the global variable NSLocaleCurrencyCode..there is less probabilty to mistake thanks to the documentation and the auto-complete function of XCode.
        NSString *currencySymbol = [here objectForKey:NSLocaleCurrencySymbol];
        
        NSLog(@"La valuta e' %@, and the symbol is %@.",currency, currencySymbol);

//other global variables can be found in the documentation, below a couple of further examples.
        
        NSString *calendar = [here objectForKey:NSLocaleCalendar];
        NSLog(@"The preferred calendar is %@.",calendar);
        NSString *metricSystemYN = [here objectForKey:NSLocaleUsesMetricSystem];
        NSString *measurementSystem = [here objectForKey:NSLocaleMeasurementSystem];
        NSString *decSep = [here objectForKey:NSLocaleDecimalSeparator];
        NSString *gpSep = [here objectForKey:NSLocaleGroupingSeparator];
        NSLog(@"Does we use the metric system where we are? %@. The measurement system is %@. The decimal separator is \"%@\". The grouping separator is \"%@\".",metricSystemYN,measurementSystem, decSep,gpSep);
    }
    return 0;
}
=======
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
>>>>>>> 47cf9a6df094a48b0a93cc99ad6e98a0bd0088c7
