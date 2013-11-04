//
//  HomeLocationViewController.h
//  Welcome2.0
//
//  Created by Snell, Luke J on 2013-10-29.
//  Copyright (c) 2013 Snell, Luke J. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeLocationViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) IBOutlet UIPickerView *homePicker;
@property (strong, nonatomic) NSArray *liveWith;
-(IBAction)buttonPressed;

@end
