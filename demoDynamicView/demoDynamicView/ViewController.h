//
//  ViewController.h
//  demoDynamicView
//
//  Created by KhiemND on 12/16/15.
//  Copyright © 2015 KhiemND. All rights reserved.
//

@class DynamicView;
@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextField *productTypeTextfield;
@property (nonatomic, weak) IBOutlet DynamicView *dynamicView;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *heightDynamicView;

@end

