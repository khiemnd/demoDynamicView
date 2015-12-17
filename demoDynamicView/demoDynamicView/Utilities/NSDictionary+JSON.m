//
//  NSDictionary+JSON.m
//  iMobileMe
//
//  Created by Liem Vo Uy on 1/7/14.
//
//

#import "NSDictionary+JSON.h"

@implementation NSDictionary (JSON)

- (NSDictionary *) dictionaryForKey: (NSString *) key {
    NSDictionary * result = [self objectForKey:key];
    return [result isKindOfClass:[NSDictionary class]] ? result : nil;
}

- (NSArray *) arrayForKey: (NSString *) key {
    NSArray * result = [self objectForKey:key];
    return [result isKindOfClass:[NSArray class]] ? result : nil;
}

- (BOOL) boolForKey: (NSString *) key {
    id obj = [self objectForKey:key];
    if([obj respondsToSelector:@selector(boolValue)]) {
        return [obj boolValue];
    }
    
    if([obj respondsToSelector:@selector(description)]) {
        return [[obj description] boolValue];
    }
    
    return NO;
}

- (NSNumber *) numberForKey: (NSString *) key {
    id result = [self objectForKey:key];
    if([result isKindOfClass:[NSNumber class]]) {
        return result;
    }

    return nil;
}

- (int) intForKey: (NSString *) key {
    id obj = [self objectForKey:key];
    if([obj respondsToSelector:@selector(intValue)]) {
        return [obj intValue];
    }
    if([obj respondsToSelector:@selector(description)]) {
        return (long) [[obj description] intValue];
    }
    
    return 0;
}

- (long) longForKey: (NSString *) key {
    id obj = [self objectForKey:key];
    if([obj respondsToSelector:@selector(longValue)]) {
        return [obj longValue];
    }
    if([obj respondsToSelector:@selector(description)]) {
        return (long) [[obj description] longLongValue];
    }
    
    return 0;
}

- (long long) longlongForKey: (NSString *) key {
    id obj = [self objectForKey:key];
    if([obj respondsToSelector:@selector(longLongValue)]) {
        return [obj longLongValue];
    }
    if([obj respondsToSelector:@selector(description)]) {
        return (long) [[obj description] longLongValue];
    }
    
    return 0;
}

- (double) doubleForKey: (NSString *) key {
    id obj = [self objectForKey:key];
    if([obj respondsToSelector:@selector(doubleValue)]) {
        return [obj doubleValue];
    }
    if([obj respondsToSelector:@selector(description)]) {
        return (long) [[obj description] doubleValue];
    }
    
    return 0;
}

- (NSString *) stringForKey: (NSString *) key {
    id obj = [self objectForKey:key];
    if([obj isKindOfClass:[NSString class]]) {
        return obj;
    }
    
    if([obj respondsToSelector:@selector(description)]) {
        return [obj description];
    }
    
    return nil;
}

- (NSString *) generateJSONStringfromDict{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:(NSJSONWritingOptions) (0)
                                                         error:&error];
    
    if (! jsonData) {
        NSLog(@"bv_jsonStringWithPrettyPrint: error: %@", error.localizedDescription);
        return @"{}";
    } else {
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
}

@end
