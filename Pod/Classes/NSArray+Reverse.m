//
//  NSArray+Reverse.m
//  SBCategories
//
//  Created by Ellidi Jatgeirsson on 9/29/14.
//  Copyright (c) 2014 Elliot. All rights reserved.
//

#import "NSArray+Reverse.h"

@implementation NSArray (Reverse)

- (NSArray *)reversedArray
{
    NSMutableArray *reversedArticles = [[NSMutableArray alloc] init];
    NSEnumerator *enumerator = [self reverseObjectEnumerator];
    for (NSObject *object in enumerator){
        [reversedArticles addObject:object];
    }
    return [reversedArticles copy];
}

@end
