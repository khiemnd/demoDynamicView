//
//  ViewController.m
//  demoDynamicView
//
//  Created by KhiemND on 12/16/15.
//  Copyright © 2015 KhiemND. All rights reserved.
//

#import "ViewController.h"
#import "ParseManager.h"
#import "TypeProductEntity.h"

int kpaddingHeightView = 17;


@interface ViewController (){
}
- (void)loadData;
- (void) showProgressHUD;
- (void) hideProgessHUD;

@property (nonatomic,strong) NSMutableArray *arrayProductType;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"demo dynamic control";
    
    self.heightDynamicView.constant = kpaddingHeightView;
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private method

- (void)loadData{
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL
                                                          URLWithString:@"http://www.jsoneditoronline.org/?id=2025f42abb2c5ca7cd6c44aec67b75ca"]
                                             cachePolicy:NSURLRequestUseProtocolCachePolicy
                                         timeoutInterval:30];
    
    NSURLSession *session = [NSURLSession new];
    
    self.arrayProductType = [[NSMutableArray alloc] init];
    
    __weak ViewController *weakSafeSelf = self;
    
    [session dataTaskWithRequest:request completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
        if (error == nil) {
            NSDictionary *responseData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            if (responseData) {
                
                NSArray *arrayDict = [responseData objectForKey:@"data"];
                
                if (arrayDict != nil && [arrayDict isKindOfClass:[NSArray class]]) {
                    for (NSDictionary *dict in arrayDict) {
                        TypeProductEntity *productEntity = [[ParseManager sharedParseManager] parseTypeProductData:dict];
                        if (productEntity != nil) {
                            [weakSafeSelf.arrayProductType addObject:productEntity];
                        }
                    }
                }
                
            }
            
        }
        else{
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil
                                                                                      message:[NSString stringWithFormat:@"Failed with error code(%d) message:\n%@",(int)error.code, error.localizedDescription]
                                                                               preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {
                                                                  }];
            [alertController addAction:cancelAction];
        }
        
        [MBProgressHUD hideAllHUDsForView:weakSafeSelf.view animated:YES];
    }];
}

- (void)showProgressHUD{
    
}

- (void)hideProgessHUD{
    
}

#pragma mark - uitextfield delegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    if (self.productTypeTextfield == textField) {
        
        NSMutableArray *arrayString = [NSMutableArray array];
        
        for (TypeProductEntity *entity in self.arrayProductType) {
            NSString *nameProductType = [entity.name mutableCopy];
            [arrayString addObject:nameProductType];
        }
        
        
        [ActionSheetStringPicker showPickerWithTitle:@"Chọn ngành hàng"
                                                rows:arrayString initialSelection:0
                                           doneBlock:^(ActionSheetStringPicker *picker, NSInteger selectedIndex, id selectedValue) {
            
        }
                                         cancelBlock:^(ActionSheetStringPicker *picker) {
            
        }
                                              origin:nil];
        
        
        return NO;
    }
    
    
    return NO;
}
@end
