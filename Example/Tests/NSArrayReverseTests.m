//
//  NSArrayReverseTests.m
//  SBCategories
//
//  Created by Ellidi Jatgeirsson on 9/29/14.
//  Copyright (c) 2014 Elliot. All rights reserved.
//

#import "NSArray+Reverse.h"

SpecBegin(NSArrayReverseSpecs)

describe(@"test reverse", ^{
    __block NSArray *array;
    
    beforeAll(^{
        array = @[@"one",@"2",[NSNumber numberWithInt:3]];
    });
    
    it(@"correctly reverses the objects", ^{
        expect([array reversedArray][0]).to.equal([NSNumber numberWithInt:3]);
        expect([array reversedArray][1]).to.equal(@"2");
        expect([array reversedArray][2]).to.equal(@"one");
    });
});

SpecEnd
