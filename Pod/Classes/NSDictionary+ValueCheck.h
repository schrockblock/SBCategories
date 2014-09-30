//
//  NSDictionary+ValueCheck.h
//  Candle
//
//  Created by Ellidi Jatgeirsson on 7/29/14.
//  Copyright (c) 2014 Ellidi Jatgeirsson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (ValueCheck)
- (BOOL)hasValueForKey:(NSString *)key;
- (BOOL)hasNameValueForKey:(NSString *)key;
@end
