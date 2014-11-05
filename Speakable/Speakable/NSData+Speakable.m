//
//  NSData+Speakable.m
//  Speakable
//
//  Created by Raffaele Rainone on 02/11/14.
//  Copyright (c) 2014 Raffaele Rainone. All rights reserved.
//

#import "NSData+Speakable.h"

@implementation NSData(Speakable)

- (NSString *)encodeAsSpeakableString
{
    NSArray *theList = [[NSArray alloc] initWithObjects:@"Camry",@"Nikon", @"Apple", @"Ford", @"Audi", @"Google",@"Nike", @"Amazon", @"Honda", @"Mazda", @"Buick",@"Fiat", @"Jeep", @"Lexus", @"Volvo", @"Fuji",@"Sony", @"Delta", @"Focus", @"Puma", @"Samsung",@"Tivo", @"Halo", @"Sting", @"Shrek", @"Avatar",@"Shell", @"Visa", @"Vogue", @"Twitter", @"Lego",@"Pepsi", nil];
    NSMutableString *speakable = [[NSMutableString alloc] init];
    for (int i = 0; i < [self length]; i++) {
        NSRange theRange = {i, 1};
        int64_t theByte;
        [self getBytes:&theByte range:theRange];
        int64_t theNumber = ((theByte >> 5) & 0x7)+2;//thanks to >>5, we only consider the first 3 bits.
                            //Then, 0x7, in bit, is |0|0|0|0|0|1|1|1|. first3Bit & 0x7 will give us a number between 0 and 7. Then we add 2 because we don't consider 0 or 1.
        
        int64_t labelForName = theByte & 0x1f;// As above, 0x1f is |0|0|0|1|1|1|1|1|.
        //NSLog(@"This should be in [0,31] %llx",labelForName);

        if (i != ([self length]-1)) {
            NSString *firstPartOfString = [[NSString alloc] initWithFormat:@"%lld ",theNumber];
            NSString *secondPartOfString = [[NSString alloc] initWithFormat:@"%@ ",theList[labelForName]];
            [speakable appendString:firstPartOfString];
            [speakable appendString:secondPartOfString];
        } else{
            NSString *firstPartOfString = [[NSString alloc] initWithFormat:@"%lld ",theNumber];
            NSString *secondPartOfString = [[NSString alloc] initWithFormat:@"%@",theList[labelForName]];
            [speakable appendString:firstPartOfString];
            [speakable appendString:secondPartOfString];
        }
    }
    return speakable;
}

+ (NSData *)dataWithSpeakableString:(NSString *)s error:(NSError **)e
{
    //-------NSLog(@"%@",s);
    NSString *errorSpecification = [[NSString alloc] init];
    BOOL success = true;

    if (!s) {//if the string is empty then we return nothing!
        success = false;
        errorSpecification = @"No string given";
    }
    NSDictionary *theList = @{@"Camry" : @0,@"Nikon" : @1, @"Apple" : @2, @"Ford" : @3,
                              @"Audi" : @4, @"Google" : @5, @"Nike" : @6, @"Amazon" : @7,
                              @"Honda" : @8, @"Mazda" : @9, @"Buick" : @10, @"Fiat" : @11,
                              @"Jeep" : @12, @"Lexus" : @13, @"Volvo" : @14, @"Fuji" : @15,
                              @"Sony" : @16, @"Delta" : @17, @"Focus" : @18, @"Puma" : @19,
                              @"Samsung" : @20, @"Tivo" : @21, @"Halo" : @22, @"Sting" : @23,
                              @"Shrek" : @24, @"Avatar" : @25, @"Shell" : @26, @"Visa" : @27,
                              @"Vogue" : @28, @"Twitter" : @29, @"Lego" : @30,@"Pepsi" : @31, };
    NSMutableData *result = [NSMutableData data];

    NSUInteger i = 0;
    while (i < s.length && success) {//i=0 means that we start from the first character. Then i will become (if there is no error) the index after the space after the word after the digit that is in position i.
        NSCharacterSet *digits = [NSCharacterSet decimalDigitCharacterSet];//the digits 0--9
        NSCharacterSet *space = [NSCharacterSet whitespaceCharacterSet];//the space character
        NSCharacterSet *letters = [NSCharacterSet letterCharacterSet];//the letters
        //If the first char of the string is not a digit then we have an error and we return it.
        //Similarly, if the string is not well formatted. i.e. that there is a word starting at index digitRange.location+2.
        BOOL isItADigit = [digits characterIsMember:[s characterAtIndex:i]];
        BOOL isItASpace = [space characterIsMember:[s characterAtIndex:i+1]];
        BOOL isItALetter = [letters characterIsMember:[s characterAtIndex:i+2]];
        if (!isItADigit | !isItASpace | !isItALetter){
            success = false;
            errorSpecification = @"String not formatted well";
            //---------NSLog(@"formatted, i = %lu",i);
            break;
        }
        
        //Need to find the word. We know that the word 'should' start at index digitRange.location+1 (otherwise there is an error because the string is not formatted us we require). We need to find where the word ends.
        NSRange searchRange;
        searchRange.location = i+2;
        searchRange.length = [s length] - searchRange.location;
        NSRange spaceRange = [s rangeOfCharacterFromSet:space
                                                options:NSLiteralSearch
                                                  range:searchRange];
        NSRange theWordRange;
        if (spaceRange.length != 0){
            //now we know that the word goes from i+2 to spaceRange.location therefore the range starts from i+2 and has length spaceRange.location - (i+2) + 1
            theWordRange.location = i+2;
            theWordRange.length = spaceRange.location - (i+2) + 1;
        } else{//if there is no space after the word then we end the string. Hence we need to say that the word starts at location i+2 and terminate at the end of the string.
            theWordRange.location = i+2;
            theWordRange.length = [s length] - (i+2);
            //---------NSLog(@"%lu,%lu",theWordRange.location,theWordRange.length);
            spaceRange.location = s.length;//because since there is no space there is no location
        }
        //I use getCharacters:range: so I need a buffer.
        //IS THERE A BETTER WAY TO DO THE FOLLOWING x LINES???
        NSUInteger lengthOfBuffer = spaceRange.location - i - 2;
        //---------NSLog(@"i = %lu. spaceRange.location = %lu, length of buffer: %lu",i, spaceRange.location,lengthOfBuffer);
        unichar aBuffer[lengthOfBuffer];
        [s getCharacters:aBuffer
                   range:theWordRange];
        NSString *word = [NSString stringWithCharacters:aBuffer
                                                 length:lengthOfBuffer];
        //---------NSLog(@"%@, length of the word is %lu",word,word.length);
        //Now we need to know at which position in theList the word sits (this is the reason why we used the dictionary structure, rather than an array).
        if (![theList objectForKey:word]){
            success = false;
            errorSpecification = @"Word not in the string";
            //---------NSLog(@"word missing: %@", word);
            break;
        }
        int64_t numberAtPositionI = [s characterAtIndex:i] & 0x07;
        int64_t theDigitInPositionIMinusTwo = numberAtPositionI - 2;
        int64_t firstPart = (theDigitInPositionIMinusTwo & 0x07) << 5 ;//This is the first 3 bits. Then we need OR with the number that represents the position of the word.
        //Now the second part of the byte
        int64_t secondPart;
        secondPart = [[theList objectForKey:word] longLongValue] & 0x1f;
        int64_t finalByte = secondPart | firstPart ;
        [result appendBytes:&finalByte length:1];

        i = spaceRange.location + 1;// now we start from the character after the (first) space after the word
    }

    //if success is false then we terminate the loop for one of the following reasons:
    //1. the string sintax was not right: i.e. not like "number "1space" word"
    //2. the word was not in our list
    if (!success) {
        if (e) {
            NSDictionary *userInfo = @{NSLocalizedDescriptionKey:errorSpecification};
            *e = [NSError errorWithDomain:@"SpeakableBytes"
                                     code:1
                                 userInfo:userInfo];
            return nil;
        }
    }
    return [result copy];
}
@end