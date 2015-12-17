//
//  ControlEntity.h
//  demoDynamicView
//
//  Created by KhiemND on 12/16/15.
//  Copyright © 2015 KhiemND. All rights reserved.
//

@interface ControlEntity : NSObject{
    
}

- (id) getValueControlEntity;

@property (nonatomic, strong) NSNumber * idControl;
@property (nonatomic, strong) NSString * nameControl;
@property (nonatomic, strong) NSString * valueControl;
@property (nonatomic, assign) int typeControl;
@end
