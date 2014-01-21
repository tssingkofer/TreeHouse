//
//  LoginController.h
//  TreeHouse
//
//  Created by Christopher Dadisman on 12/17/13.
//  Copyright (c) 2013 Tyler Singkofer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParseInterface.h"
#import "XMLParseLogin.h"

@interface LoginController : UIViewController
<UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *pickerLocation;
@property (weak, nonatomic) IBOutlet UITextField *pass;
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (retain, nonatomic) NSArray *locations;

@property (weak, nonatomic) IBOutlet UIButton *login;
-(IBAction) login:(id)sender;
- (void) success: (NSMutableArray *) data;
@end
