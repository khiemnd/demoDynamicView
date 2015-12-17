//
//  ParseManager.m
//  demoDynamicView
//
//  Created by KhiemND on 12/16/15.
//  Copyright © 2015 KhiemND. All rights reserved.
//

#import "ParseManager.h"
#import "TypeProductEntity.h"
#import "ControlEntity.h"

@implementation ParseManager
SYNTHESIZE_SINGLETON_FOR_CLASS(ParseManager);

- (TypeProductEntity*) parseTypeProductData:(NSDictionary*)data{
    if (data && [data isKindOfClass:[NSDictionary class]]){
        TypeProductEntity * typeProduct = [TypeProductEntity new];
        
        typeProduct.name = [data stringForKey:@"name"];
        typeProduct.idTypeProduct = [data numberForKey:@"id"];
        
        NSArray *arrayControlsDict = [data arrayForKey:@"extra"];
        
        NSMutableArray *arrayControls = [NSMutableArray array];
        
        for (NSDictionary *dict in arrayControlsDict) {
            ControlEntity *controlEntity = [self parseControlData:dict];
            [arrayControls addObject:controlEntity];
        }
        
        typeProduct.arrayControl = arrayControls;
        
        return typeProduct;
    }
    return nil;
}

- (ControlEntity*) parseControlData:(NSDictionary*)data{
    if (data && [data isKindOfClass:[NSDictionary class]]){
        ControlEntity *controlEntity = [ControlEntity new];
        
        controlEntity.nameControl = [data stringForKey:@"name"];
        controlEntity.idControl = [data numberForKey:@"id"];
        controlEntity.typeControl = [data intForKey:@"type"];
        controlEntity.valueControl = [data stringForKey:@"value"];
        
        return controlEntity;
    }
    return nil;
}
@end
