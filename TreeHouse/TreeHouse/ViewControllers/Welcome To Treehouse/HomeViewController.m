//
//  HomeViewController.m
//  Welcome2.0
//
//  Created by Snell, Luke J on 2013-10-29.
//  Copyright (c) 2013 Snell, Luke J. All rights reserved.
//

#import "HomeViewController.h"
#import "ParentViewController.h"

@interface HomeViewController ()

@end
ParseInterface *parse;
@implementation HomeViewController


@synthesize fNameText, insert, fName, lName, mi, address, city, state, zip, homePhone, cellPhone, eMail, DOB, age, gender, gradDate, grade, middleSchool, highSchool, livingField, ethnicityField, referralField;
//@synthesize MIName;

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString *fNameString = fNameText.text;
    ParentViewController *PVC = [segue destinationViewController];
    PVC.firstName = fNameString;

        NSLog(@"Prepare for Segue");
        if ([[segue identifier] isEqualToString:@"done"]) //enter button name
        {
            [insert addObject:@{@"FirstName": fName}];
            [insert addObject:@{@"LastName": lName}];
            [insert addObject:@{@"MI": mi}];
            [insert addObject:@{@"Address": address}];
            [insert addObject:@{@"City": city}];
            [insert addObject:@{@"State": state}];
            [insert addObject:@{@"Zip": zip}];
            [insert addObject:@{@"PhoneHome": homePhone}];
            [insert addObject:@{@"PhoneMobile": cellPhone}];
            [insert addObject:@{@"Email": eMail}];
            [insert addObject:@{@"DOB": DOB}];
            [insert addObject:@{@"Age": age}];
            [insert addObject:@{@"Gender": gender}];
            [insert addObject:@{@"Grade": grade}];
            [insert addObject:@{@"School": middleSchool}];
            [insert addObject:@{@"HighSchool": highSchool}];
            [insert addObject:@{@"GradDate": gradDate}];
            [parse submitName:insert];
        }
}

-(BOOL)textFieldShouldReturn:(UITextField*)textField;
{
    NSInteger nextTag = 10;
    // Try to find next responder
    UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];
    if (nextResponder) {
        // Found next responder, so set it.
        [nextResponder becomeFirstResponder];
    } else {
        // Not found, so remove keyboard.
        [textField resignFirstResponder];
    }
    return NO; // We do not want UITextField to insert line-breaks.
}
- (void)viewDidLoad
{
    [super viewDidLoad];
//    [fNameText becomeFirstResponder];
    ParseInterface *parse = [ParseInterface alloc];
    
    livesWith = @[@"Mom", @"Dad", @"Step Mom", @"Step Dad", @"Mom's Boyfriend/Partner", @"Dad's Girlfriend/Partner", @"Brothers", @"Sisters", @"Other Relatives", @"Foster Parents"];
    
    ethnicity = @[@"American Indian/Alaska Native", @"Black/African American", @"Asian", @"Native Hawaiian/PacificIslander", @"White"
                  ];
    referral = @[@"Other Teen/Friend", @"Parent/Other Family Member", @"Teacher/School Counselor/School Staff", @"Pastor/Minister/Church Staff", @"Therapist/Social Worker", @"Probation Officer", @"Treehouse staff"
                      ];

    PickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 43, 320, 480)];
    
    PickerView.delegate = self;
    
    PickerView.dataSource = self;
    
    [PickerView  setShowsSelectionIndicator:YES];
    
    livingField.inputView =  PickerView;
    ethnicityField.inputView = PickerView;
    referralField.inputView = PickerView;
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if ([livingField isFirstResponder]) {
        return [livesWith count];
    }
    else if ([ethnicityField isFirstResponder]){
        return [ethnicity count];
    }
    else if ([referralField isFirstResponder]){
        return [referral count];
    }
    else {
        return 0;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if ([livingField isFirstResponder]) {
        return [livesWith objectAtIndex:row];
    }
    else if ([ethnicityField isFirstResponder]){
        return [ethnicity objectAtIndex:row];
    }
    else if ([referralField isFirstResponder]){
        return [referral objectAtIndex:row];
    }
    else {
        return 0;
    }
}

- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component

{
    if ([livingField isFirstResponder]) {
        livingField.text = [livesWith objectAtIndex:row];
    }
    else if ([ethnicityField isFirstResponder]){
        ethnicityField.text = [ethnicity objectAtIndex:row];
    }
    else if ([referralField isFirstResponder]){
        referralField.text = [referral objectAtIndex:row];
    }
    else {
        return;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)livingEditingDidBegin:(id)sender {
    [PickerView reloadAllComponents];
}

- (IBAction)ethnicityEditingDidBegin:(id)sender {
    [PickerView reloadAllComponents];
}

- (IBAction)referralEditingDidBegin:(id)sender {
    [PickerView reloadAllComponents];
}
@end
