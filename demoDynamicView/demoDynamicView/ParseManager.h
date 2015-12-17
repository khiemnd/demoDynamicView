//
//  ParseManager.h
//  demoDynamicView
//
//  Created by KhiemND on 12/16/15.
//  Copyright © 2015 KhiemND. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TypeProductEntity;
@class ControlEntity;

@interface ParseManager : NSObject
+ (id) sharedParseManager;
- (TypeProductEntity*) parseTypeProductData:(NSDictionary*)data;
- (ControlEntity*) parseControlData:(NSDictionary*)data;
@end
