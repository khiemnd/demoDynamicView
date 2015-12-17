//
//  NSDictionary+JSON.h
//  iMobileMe
//
//  Created by Liem Vo Uy on 1/7/14.
//
//

#import <Foundation/Foundation.h>

@interface NSDictionary (JSON)
- (NSDictionary *) dictionaryForKey: (NSString *) key;
- (NSArray *) arrayForKey: (NSString *) key;
- (int) intForKey: (NSString *) key;
- (long) longForKey: (NSString *) key;
- (long long) longlongForKey: (NSString *) key;
- (BOOL) boolForKey: (NSString *) key;
- (double) doubleForKey: (NSString *) key;
- (NSNumber *) numberForKey: (NSString *) key;
- (NSString *) stringForKey: (NSString *) key;
- (NSString *) generateJSONStringfromDict;
@end
