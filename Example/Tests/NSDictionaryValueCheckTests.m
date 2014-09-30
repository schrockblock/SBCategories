//
//  NSDictionaryValueCheckTests.m
//  SBCategories
//
//  Created by Ellidi Jatgeirsson on 9/29/14.
//  Copyright (c) 2014 Elliot. All rights reserved.
//

#import "NSDictionary+ValueCheck.h"

SpecBegin(NSDictionaryValueCheckSpecs)

describe(@"test hasValueForKey", ^{
    __block NSDictionary *dictionary;
    
    beforeAll(^{
        dictionary = @{@"key":@"value",
                       @"null_key":[NSNull null]};
    });
    
    it(@"returns true when it finds a valid value", ^{
        expect([dictionary hasValueForKey:@"key"]).to.equal(YES);
    });
    
    it(@"returns false when object is null", ^{
        expect([dictionary hasValueForKey:@"null_key"]).to.equal(NO);
    });
    
    it(@"returns false when the key does not exist", ^{
        expect([dictionary hasValueForKey:@"non_existent_key"]).to.equal(NO);
    });
});

describe(@"test hasNameValueForKey", ^{
    __block NSDictionary *dictionary;
    
    beforeAll(^{
        dictionary = @{@"sub_dict":@{@"name":@"value"},
                       @"bad_sub_dict":@{@"not_name":@"value"},
                       @"null_sub_dict":@{@"name":[NSNull null]}};
    });
    
    it(@"returns true when it finds a valid value for name", ^{
        expect([dictionary hasNameValueForKey:@"sub_dict"]).to.equal(YES);
    });
    
    it(@"returns false when object is null", ^{
        expect([dictionary hasNameValueForKey:@"null_sub_dict"]).to.equal(NO);
    });
    
    it(@"returns false when the key does not exist", ^{
        expect([dictionary hasNameValueForKey:@"non_existent_key"]).to.equal(NO);
    });
});

SpecEnd
