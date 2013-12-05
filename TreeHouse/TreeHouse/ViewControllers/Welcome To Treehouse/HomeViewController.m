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


@synthesize fNameText, insert, fName, lName, mi, address, city, state, zip, homePhone, cellPhone, eMail, DOB, age, gender, gradDate, grade, middleSchool, highSchool;
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
    [fNameText becomeFirstResponder];
    ParseInterface *parse = [ParseInterface alloc];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
