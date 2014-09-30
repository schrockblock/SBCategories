//
//  NSDictionary+ValueCheck.m
//  Candle
//
//  Created by Ellidi Jatgeirsson on 7/29/14.
//  Copyright (c) 2014 Ellidi Jatgeirsson. All rights reserved.
//

#import "NSDictionary+ValueCheck.h"

@implementation NSDictionary (ValueCheck)

+ (BOOL)dictionary:(NSDictionary *)dictionary hasValueForKey:(NSString *)key
{
    return dictionary
    && [dictionary isKindOfClass:[NSDictionary class]]
    && [[dictionary allKeys] containsObject:key]
    && dictionary[key] != [NSNull null];
}

+ (BOOL)dictionary:(NSDictionary *)dict hasNameValueForKey:(NSString *)key
{
    return [NSDictionary dictionary:dict hasValueForKey:key]
    && [NSDictionary dictionary:dict[key] hasValueForKey:@"name"];
}

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