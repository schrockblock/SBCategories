//
//  NSDictionary+ValueCheck.m
//  Candle
//
//  Created by Ellidi Jatgeirsson on 7/29/14.
//  Copyright (c) 2014 Ellidi Jatgeirsson. All rights reserved.
//

#import "NSDictionary+ValueCheck.h"

@implementation NSDictionary (ValueCheck)

- (BOOL)hasNameValueForKey:(NSString *)key
{
    return [self hasValueForKey:key]
    && [self[key] hasValueForKey:@"name"];
}

- (BOOL)hasValueForKey:(NSString *)key
{
    return self
    && [self isKindOfClass:[NSDictionary class]]
    && [[self allKeys] containsObject:key]
    && self[key] != [NSNull null];
}

@end