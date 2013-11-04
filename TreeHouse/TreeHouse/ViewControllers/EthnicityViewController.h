//
//  EthnicityViewController.h
//  Welcome2.0
//
//  Created by Snell, Luke J on 2013-10-29.
//  Copyright (c) 2013 Snell, Luke J. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EthnicityViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) NSArray *ethnicity;
@property (weak, nonatomic) IBOutlet UIPickerView *ethicityPicker;



@end
