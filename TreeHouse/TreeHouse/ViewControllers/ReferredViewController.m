//
//  ReferredViewController.m
//  Welcome2.0
//
//  Created by Snell, Luke J on 2013-10-29.
//  Copyright (c) 2013 Snell, Luke J. All rights reserved.
//

#import "ReferredViewController.h"

@interface ReferredViewController ()

@end

@implementation ReferredViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.referral = @[@"Other Teen/Friend", @"Parent/Other Family Member", @"Teacher/School Counselor/School Staff", @"Pastor/Minister/Church Staff", @"Therapist/Social Worker", @"Probation Officer", @"Treehouse staff"
                       ];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Picker Data Source Methods
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.referral count];
}
#pragma mark Picker Delegate Methods
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.referral[row];
}

@end
