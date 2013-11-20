//
//  EthnicityViewController.m
//  Welcome2.0
//
//  Created by Snell, Luke J on 2013-10-29.
//  Copyright (c) 2013 Snell, Luke J. All rights reserved.
//

#import "EthnicityViewController.h"

@interface EthnicityViewController ()

@end

@implementation EthnicityViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.ethnicity = @[@"American Indian/Alaska Native", @"Black/African American", @"Asian", @"Native Hawaiian/PacificIslander", @"White"
                       ];
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
    if ([pickerView tag] == 1) {
        return [self.ethnicity count];
    }
    else //if([pickerView tag] == 2)
    {
        return [self.referral count];
    }
    
}

#pragma mark Picker Delegate Methods
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if ([pickerView tag] == 1) {
        return self.ethnicity[row];
    }
    else //if([pickerView tag] == 2)
    {
        return self.referral[row];
    }
    
}


@end
