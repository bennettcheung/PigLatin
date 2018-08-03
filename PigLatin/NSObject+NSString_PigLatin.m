//
//  NSObject+NSString_PigLatin.m
//  PigLatin
//
//  Created by Bennett on 2018-08-03.
//  Copyright © 2018 Bennett. All rights reserved.
//

#import "NSObject+NSString_PigLatin.h"

@implementation NSString (NSString_PigLatin)

-(NSString *)stringByPigLatinization{
    
    NSCharacterSet *vowelSet = [NSCharacterSet characterSetWithCharactersInString:@"aeiou"];
    
    NSMutableArray *words=[[self componentsSeparatedByString:@" "] mutableCopy];
    
    for (int i=0; i< [words count]; i++)
    {

        //convert to lowercase string first
        NSString *tempString = [words objectAtIndex:i];
        
        //save the capitalization for later
        BOOL capitalizeString = [tempString isEqualTo:[tempString capitalizedString]];
        
        //convert to lower case before we move the letters around
        tempString = [tempString lowercaseString];
        NSMutableString* word = [[NSMutableString alloc] initWithString:tempString];
        
        //find the first vowel
        NSRange range = [word rangeOfCharacterFromSet:vowelSet];
    
        if (range.location == 0) //special case if the word starts with a vowel
        {
            [word appendString:@"yay"];
        }
        else{
            NSRange consonantRange = NSMakeRange(0, range.location);
            range.length = [word length] - range.location;
            
            word = [NSMutableString stringWithFormat:@"%@%@ay", [word substringWithRange:range], [word substringWithRange:consonantRange]];
        }
        
        //add the capitalized string to the string if the original word was capitalize
        if (capitalizeString)
            word = [[word capitalizedString] mutableCopy];
        
        //replace the word in the array
        [words replaceObjectAtIndex:i withObject:word];
    }
    return [words componentsJoinedByString:@" "];
}
@end
