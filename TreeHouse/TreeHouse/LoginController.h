//
//  LoginController.h
//  TreeHouse
//
//  Created by Christopher Dadisman on 12/17/13.
//  Copyright (c) 2013 Tyler Singkofer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginController : UIViewController
<UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *pickerLocation;
@property (weak, nonatomic) IBOutlet UITextField *pass;
@property (retain, nonatomic) NSArray *locations;
@end
