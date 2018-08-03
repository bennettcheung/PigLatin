//
//  main.m
//  PigLatin
//
//  Created by Bennett on 2018-08-03.
//  Copyright © 2018 Bennett. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+NSString_PigLatin.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSString *stringToTranslate = @"Kale Chips";
        
        NSLog(@"%@", [stringToTranslate stringByPigLatinization]);
        
        stringToTranslate = @"A brown fox jumped over the fence";
        NSLog(@"%@", [stringToTranslate stringByPigLatinization]);
    }
    return 0;
}
